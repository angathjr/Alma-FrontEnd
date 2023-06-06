import 'package:alma/search/controllers/search_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.height,
    required this.width,
    required this.searchController,
    required this.index,
  });

  final double height;
  final double width;
  final int index;
  final EventSearchController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Container(
          width: width,
          height: height * .22,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Constants.cardColor().withOpacity(0.7),
          ),
          child: Row(
            children: [
              if (searchController.events[index].imgUrl != "")
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: height * 0.15,
                      width: width * .01,
                      //color: Colors.green,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      context.theme.disabledColor),
                                  value: downloadProgress.progress),
                            ),
                            imageUrl:
                                "${searchController.events[index].imgUrl}}",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              Expanded(
                flex: 5,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: Text(
                      "${searchController.events[index].eventName}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${searchController.events[index].eventDescription}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          )),
    );
  }
}
