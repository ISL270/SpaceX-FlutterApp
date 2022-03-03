import 'package:bloc_news/Data_layer/models/launch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Launch extends StatefulWidget {
  final LaunchModel launch;
  const Launch({Key? key, required this.launch}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff585858),
      appBar: AppBar(
        title: Text(widget.launch.name!, style: Tstyle),
        backgroundColor: const Color(0xff4d4d4d),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Date: ${widget.launch.dateUtc}", style: Tstyle),
            Text("Launch Pad ID: ${widget.launch.launchpad}", style: Tstyle),
            Text("Rocket ID: ${widget.launch.rocket}", style: Tstyle),
            Text("Pay Loads ID: ${widget.launch.payloads![0]}", style: Tstyle),
            ElevatedButton(
                onPressed: () => FlutterWebBrowser.openWebPage(
                      url: widget.launch.links!.webcast!,
                      customTabsOptions: const CustomTabsOptions(
                        colorScheme: CustomTabsColorScheme.dark,
                        addDefaultShareMenuItem: true,
                        defaultColorSchemeParams: CustomTabsColorSchemeParams(
                            toolbarColor: Colors.blue,
                            secondaryToolbarColor: Colors.grey,
                            navigationBarColor: Colors.grey),
                        instantAppsEnabled: true,
                        showTitle: true,
                        urlBarHidingEnabled: true,
                      ),
                    ),
                child: Text(
                  "View Launch Video",
                  style: Tstyle,
                ))
          ],
        ),
      ),
    );
  }

  TextStyle Tstyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
