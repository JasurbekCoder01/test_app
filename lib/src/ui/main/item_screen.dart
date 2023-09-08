import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/src/bloc/item_bloc/item_bloc.dart';
import 'package:test_app/src/repositories/news/models/article.dart';
import 'package:test_app/src/theme/app_theme.dart';
import 'package:test_app/src/ui/main/item_view_screen.dart';
import 'package:test_app/src/utils/utils.dart';
import 'package:test_app/src/widgets/app/loading_widget.dart';
import 'package:test_app/src/widgets/main/item_horizont_widget.dart';
import 'package:test_app/src/widgets/main/item_vertical_widget.dart';
import 'package:test_app/src/widgets/main/text_button_widget.dart';

import '../../repositories/news/mock_news_repository.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List<Article>? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    BlocProvider.of<ItemBloc>(context).add(GetItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: Container(),
      ),
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state is GetItemState) {
            data = state.data;
          }
        },
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            return data == null
                ? const LoadingWidget()
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 16 * context.w,
                            right: 20 * context.w,
                            bottom: 20 * context.w,
                            top: 44 * context.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                color: Colors.transparent,
                                child: SvgPicture.asset(
                                    "assets/icons/back_button.svg"),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButtonWidget(
                                    text: "Notification",
                                    onTap: () {},
                                  ),
                                  SizedBox(
                                    width: 36 * context.h,
                                  ),
                                  TextButtonWidget(
                                    text: "Mark all read",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 20 * context.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 28 * context.w,
                              ),
                              child: Text(
                                "Featured",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontSFPro,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20 * context.h,
                                  color: AppTheme.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 340 * context.h,
                              child: PageView.builder(
                                itemCount: data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ItemHorizontalWidget(
                                    data: data![index],
                                    onTap: () {
                                      route(data![index].id);
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 28 * context.w,
                                bottom: 10 * context.h,
                              ),
                              child: Text(
                                "Latest news",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontSFPro,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20 * context.h,
                                  color: AppTheme.black,
                                ),
                              ),
                            ),
                            ListView.builder(
                              itemCount: data!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ItemVerticalWidget(
                                  data: data![index],
                                  onTap: () {
                                    route(data![index].id);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  route(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RepositoryProvider(
          create: (context) => MockNewsRepository(),
          child: BlocProvider(
            create: (context) => ItemBloc(
              mockNewsRepository:
                  RepositoryProvider.of<MockNewsRepository>(context),
            ),
            child: ItemViewScreen(id: id),
          ),
        ),
      ),
    );
  }
}
