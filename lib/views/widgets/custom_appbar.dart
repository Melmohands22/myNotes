import 'package:flutter/material.dart';
import 'package:nots_app/constants.dart';

AppBar CustomAppbar() {
  return AppBar(
      backgroundColor: kDarkColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          "Notes",
          style: TextStyle(
              fontSize: 43, fontWeight: FontWeight.w300, color: kWhiteColor),
        ),
      ),
      actions: [
        Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Color(0xff3B3B3B)),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: kWhiteColor,
                  size: 24,
                )),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Color(0xff3B3B3B)),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: kWhiteColor,
                    size: 24,
                  )),
            ],
          ),
        ),
      ]);
}
