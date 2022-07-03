import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/icons.dart';

class PageItem extends StatefulWidget {
  final String phoneName;
  final String imgUrl;
  final String colorName;
  final String price;
  final VoidCallback whenClicked;
  final VoidCallback deleteClicked;
  final VoidCallback editClicked;
  final VoidCallback imgClicked;
  final VoidCallback itemClicked;
  final bool isSelected;
  bool isLiked = false;

  PageItem({
    Key? key,
    required this.phoneName,
    required this.imgUrl,
    required this.colorName,
    required this.price,
    required this.whenClicked,
    required this.isSelected,
    required this.deleteClicked,
    required this.editClicked,
    required this.imgClicked,
    required this.itemClicked,
  }) : super(key: key);

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.whenClicked,
      child: Container(
        height: 360.h,
        margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 6,
                offset: const Offset(0, 3),
                color: Theme.of(context).shadowColor)
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: widget.imgClicked,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                child: Image.asset(
                  widget.imgUrl,
                  height: 200.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: widget.itemClicked,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.phoneName,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                color: widget.isSelected
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            widget.colorName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: widget.isSelected
                                  ? Colors.greenAccent
                                  : Colors.blue,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "\$ ${widget.price}",
                            style: TextStyle(
                                color: widget.isSelected
                                    ? Colors.yellow
                                    : Colors.red,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                setState(
                                  () {
                                    widget.isLiked = !widget.isLiked;
                                  },
                                );
                              },
                              icon: !widget.isLiked
                                  ? SvgPicture.asset(
                                      MyIcons.heart_border,
                                      color: Colors.black,
                                    )
                                  : SvgPicture.asset(MyIcons.heart,
                                      color: Colors.red),
                            ),
                            SizedBox(width: 15.w),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: widget.deleteClicked,
                              icon: Icon(
                                Icons.delete_sharp,
                                color: Colors.black,
                                size: 28.sp,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: widget.editClicked,
                              icon: Icon(
                                Icons.edit_sharp,
                                color: widget.isSelected
                                    ? Colors.white
                                    : Colors.blue,
                                size: 28.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
