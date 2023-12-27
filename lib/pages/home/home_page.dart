import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/pages/home/components/home_components.dart';
import 'package:my_fave_app/widgets/widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgUrlList = [
      'https://image-cdn.hypb.st/https%3A%2F%2Fjp.hypebeast.com%2Ffiles%2F2023%2F04%2Fnewjeans-coca-cola-new-global-ambassadors-announcement-info-1.jpg?cbr=1&q=90',
      'https://storage.sg.content-cdn.io/cdn-cgi/image/width=720,height=900,quality=90,format=auto,fit=cover,g=top/in-resources/6ff2919b-8254-4153-83d9-376e98b3c072/Images/userimages/NGS/newjeans/Levis-NewJeans-HorizonBlue-Header.jpg',
      'https://images.genius.com/e8dad89b8c42c9127361766a02d594cd.1000x1000x1.png',
      'https://media.gqjapan.jp/photos/6423c8eaa622d1770de63b60/master/w_1600%2Cc_limit/%25E3%2580%2590MUSINSA%25E3%2580%2591%25E1%2584%2587%25E1%2585%25A9%25E1%2584%2583%25E1%2585%25A9%25E1%2584%258C%25E1%2585%25A1%25E1%2584%2585%25E1%2585%25AD%2520%25E1%2584%2582%25E1%2585%25B2%25E1%2584%258C%25E1%2585%25B5%25E1%2586%25AB%25E1%2584%2589%25E1%2585%25B3.jpg',
    ];

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            FavoritesView(imgUrlList: imgUrlList),
          ],
        ),
      ),
    );
  }
}
