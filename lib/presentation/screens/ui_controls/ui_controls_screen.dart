import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen ';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls screen'),
        ),
        body: _UiControlsView());
  }
}

enum Trasportation { car, bike, bus, train }

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = false;
  Trasportation selectedTransportation = Trasportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Enable developer mode'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text('Transportation'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('Car'),
                subtitle: const Text('Select car'),
                value: Trasportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasportation.car;
                    })),
            RadioListTile(
                title: const Text('Bike'),
                subtitle: const Text('Select bike'),
                value: Trasportation.bike,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasportation.bike;
                    })),
            RadioListTile(
                title: const Text('Bus'),
                subtitle: const Text('Select bus'),
                value: Trasportation.bus,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasportation.bus;
                    })),
            RadioListTile(
                title: const Text('Train'),
                subtitle: const Text('Select train'),
                value: Trasportation.train,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasportation.train;
                    })),
          ],
        ),
        //TODO:
        CheckboxListTile(
            title: const Text('¿Desayuno'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text('¿Almuerzo?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('¿Cena?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}

class _buildTransportationRadioList {}
