import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../models/jobs.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({Key key}) : super(key: key);

  Widget displayImage(String c) {
    print(c);

    switch (c) {
      case 'Australia':
        return Image(
          image: AssetImage('assets/images/australia.png'),
        );
        break;
      case 'Ireland':
        return Image(
          image: AssetImage('assets/images/irlanda.png'),
        );
        break;
      case 'Spain':
        return Image(
          image: AssetImage('assets/images/spain.png'),
        );
    }

    return Image(
      image: AssetImage('assets/images/spain.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Recent Jobs', style: AppStyles.title_1()),
              Text('See all', style: AppStyles.linkText(),)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: jobs
                .map((j) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: j.country == 'Australia'
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
                                      child: Image.asset(
                                        'assets/images/australia.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                    )
                                  : j.country == 'Ireland'
                                      ? Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Image.asset(
                                            'assets/images/irlanda.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Image.asset(
                                            'assets/images/espanha.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    j.title,
                                    style: AppStyles.title_1(),
                                  ),
                                  Text(
                                    j.company,
                                    style: AppStyles.descLessHeight(),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(j.currency + j.salary.toString())
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}