import 'package:ecompost/src/Provider/horario_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Horario extends StatelessWidget {
  const Horario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = TextStyle(color: Colors.white);
    const diasSemana = [
      'Lunes',
      'Martes',
      'Miercoles',
      'Jueves',
      'Viernes',
      'Sabado',
      'Domingo'
    ];
    final horarioData = Provider.of<HorarioData>(context);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: const Center(
          child: Text(
        "Horario",
        style: color,
      )),

      contentPadding: EdgeInsets.zero,
      // (horizontal:10 = left:10, right:10)(vertical:10 = top:10, bottom:10)
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Color(0xFF383838),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "Dia",
                  style: color,
                ),
                Text(
                  "Hora",
                  style: color,
                )
              ],
            ),
            const Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  alignment: AlignmentDirectional.center,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF383838),
                  style: const TextStyle(color: Colors.white),
                  value: horarioData.getDiaInicio,
                  menuMaxHeight: 150,
                  icon: const Icon(null),
                  items: diasSemana.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    horarioData.diaInicio = value.toString();
                  },
                ),
                DropdownButton(
                  alignment: AlignmentDirectional.center,

                  underline: const SizedBox(),

                  dropdownColor: const Color(0xFF383838),
                  style: const TextStyle(color: Colors.white),
                  value: horarioData.getDiaFinal,
                  // Down Arrow Icon
                  icon: const Icon(null),
                  menuMaxHeight: 150,
                  // Array list of items
                  items: diasSemana.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    horarioData.diaFinal = value.toString();
                  },
                  // After selecting the desired option,it will
                  // change button value to selected value
                ),
                TextButton(
                  child: Text(
                    '${horarioData.getHoraInicio}',
                    style: color,
                  ),
                  onPressed: () async {
                    horarioData.horaInicio =
                        await _mostrarAlert(context, horarioData.getHoraInicio);
                  },
                ),
                TextButton(
                  child: Text(
                    "${horarioData.getHoraFinal}",
                    style: color,
                  ),
                  onPressed: () async {
                    horarioData.horaFinal =
                        await _mostrarAlert(context, horarioData.getHoraFinal);
                  },
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            )
          ]),

      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Cancelar",
              style: color,
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Ok",
              style: color,
            ))
      ],
    );
  }

  Future<String> _mostrarAlert(context, String da) async {
    TimeOfDay? data =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (data == null) {
      return da;
    }

    return data.format(context);
  }
}
