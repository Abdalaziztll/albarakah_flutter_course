import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(useMaterial3: true), home: HomePage());
  }
}

List<String> lists = ['Button 1', 'Button 2', 'Button 3', 'Button 4'];
List<Icon> iconsList = [
  Icon(Icons.whatshot),
  Icon(Icons.fast_forward),
  Icon(Icons.fiber_dvr),
  Icon(Icons.face),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? gender = 'male';
  bool? isActive = false;
  Widget icon = Icon(Icons.point_of_sale);
  double quantity = 10;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RadioListTile(
              title: Text("Male"),
              value: "male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("Other"),
              value: "other",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            Checkbox(
                value: isActive,
                onChanged: (val) {
                  setState(() {
                    isActive = val;
                  });
                }),
            TextField(
              key: ValueKey('username'),
              controller: controller,
            ),
            Tooltip(
              richMessage: WidgetSpan(
                child: ListTile(
                  title: Text('Hello'),
                  subtitle:
                      Text('Ipsum aliquip sunt irure dolore culpa eiusmod.'),
                ),
              ),
              child: Switch(
                  key: ValueKey('test switch'),
                  value: isActive!,
                  onChanged: (val) {
                    setState(() {
                      isActive = val;
                    });
                    print(controller.text);
                  }),
            ),
            DropdownButton<String>(
                alignment: Alignment.topCenter,
                value: gender,
                items: [
                  DropdownMenuItem(child: Text('Hello 1'), value: 'male'),
                  DropdownMenuItem(
                    child: Text('Hello 2'),
                    value: 'female',
                  ),
                  DropdownMenuItem(
                    child: Text('Hello 3'),
                    value: 'other',
                  )
                ],
                onChanged: (val) {
                  setState(() {
                    gender = val;
                  });
                }),
            PopupMenuButton(
              icon: icon,
              tooltip: 'Hello wolrd',
              itemBuilder: (context) {
                return List.generate(
                  lists.length,
                  (index) => PopupMenuItem(
                    onTap: () {
                      setState(() {
                        icon = iconsList[index];
                      });
                    },
                    value: iconsList[index],
                    child: Text(
                      lists[index],
                    ),
                  ),
                );
              },
            ),
            RangeSlider(
                // mouseCursor: MaterialStateMouseCursor,
                values: RangeValues(quantity, 400),
                // min: 2,
                // allowedInteraction: SliderInteraction.slideOnly,
                labels: RangeLabels('min', 'max'),
                divisions: 10,
                max: 400,
                onChanged: (val) {
                  setState(() {
                    quantity = val.start;
                  });
                })
          ],
        ),
      ),
    );
  }
}
