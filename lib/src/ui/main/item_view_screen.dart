// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/src/bloc/item_bloc/item_bloc.dart';
import 'package:test_app/src/repositories/news/models/article.dart';
import 'package:test_app/src/theme/app_theme.dart';
import 'package:test_app/src/utils/utils.dart';
import 'package:test_app/src/widgets/app/custom_network_image.dart';
import 'package:test_app/src/widgets/app/loading_widget.dart';

class ItemViewScreen extends StatefulWidget {
  final String id;

  const ItemViewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ItemViewScreen> createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {
  Article? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    BlocProvider.of<ItemBloc>(context).add(GetItemWithIdEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state is GetItemWithIdState) {
            data = state.data;
          }
        },
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            return data == null
                ? const LoadingWidget()
                : ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: 495 * context.h,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            CustomNetworkImage(
                              image: data!.imageUrl,
                              height: 495 * context.h,
                              width: MediaQuery.of(context).size.width,
                              radius: 12,
                            ),
                            Container(
                              height: 495 * context.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 20,
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                    )
                                  ]),
                            ),
                            Positioned(
                              left: 16 * context.w,
                              top: 88 * context.h,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: SvgPicture.asset(
                                    "assets/icons/back_button.svg",
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 40 * context.h,
                              left: 48 * context.w,
                              right: 96 * context.w,
                              child: Text(
                                data!.title,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontSFPro,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28 * context.h,
                                  color: AppTheme.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20 * context.h),
                        child: Text(
                          data!.description ?? "",
                          style: TextStyle(
                            fontFamily: AppTheme.fontSFPro,
                            fontWeight: FontWeight.w400,
                            fontSize: 16 * context.h,
                            height: 19 / 16,
                            color: AppTheme.black,
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
