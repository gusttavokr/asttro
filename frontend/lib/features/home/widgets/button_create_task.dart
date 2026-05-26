import 'package:asttro/core/widgets/button_create.dart';
import 'package:flutter/cupertino.dart';


class ButtonCreateTask extends StatelessWidget{

  const ButtonCreateTask({super.key});

  void salvar() {
    print('Criado');
  }

  @override
  Widget build(BuildContext context) {
    return ButtonCreate(
      label: 'Criar nova Tarefa',
      onPressed: salvar,
    );
  }
}
