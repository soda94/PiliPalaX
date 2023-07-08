import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/models/video_detail_res.dart';

Widget seasonPanel(UgcSeason ugcSeason, cid) {
  return Builder(builder: (context) {
    List<EpisodeItem> episodes = ugcSeason.sections!.first.episodes!;
    int currentIndex = episodes.indexWhere((e) => e.cid == cid);
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        left: 2,
        right: 2,
      ),
      child: Material(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => showBottomSheet(
            context: context,
            builder: (_) => Container(
              height: Get.size.height - Get.size.width * 9 / 16 - 45,
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '合集（${episodes.length}）',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                  Expanded(
                    child: Material(
                      child: ListView.builder(
                        itemCount: episodes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              child: Text(
                                episodes[index].title!,
                                style: TextStyle(
                                    color: index == currentIndex
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                Text('合集：${ugcSeason.title!}'),
                const Spacer(),
                Text(
                  '${currentIndex + 1} / ${ugcSeason.epCount}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 13,
                )
              ],
            ),
          ),
        ),
      ),
    );
  });
}