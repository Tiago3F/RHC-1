import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController nomeapresentacao = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController emailpessoal = TextEditingController();
  TextEditingController filhos = TextEditingController();
  TextEditingController escolaridade = TextEditingController();
  TextEditingController escolaridaderg = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController logradouro = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.indexed : StepState.editing,
          isActive: _activeStepIndex >= 0,
          title: const Text('Dados do colaborador'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'Nome completo',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: nomeapresentacao,
                  decoration: const InputDecoration(
                    labelText: 'Nome apresentacao',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: cpf,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                  ),
                ),
                TextField(
                  controller: emailpessoal,
                  decoration: const InputDecoration(
                    labelText: 'Email pessoal',
                  ),
                ),
                TextField(
                  controller: filhos,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade de filhos',
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                const Text('Dados empresariais'),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'Email grupo brisanet',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.indexed : StepState.editing,
            isActive: _activeStepIndex >= 1,
            title: const Text('Formacao academica'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: escolaridade,
                    decoration: const InputDecoration(
                      labelText: 'Nivel de escolaridade',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: escolaridaderg,
                    decoration: const InputDecoration(
                      labelText: 'Escolaridade de registro',
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.indexed : StepState.editing,
            isActive: _activeStepIndex >= 2,
            title: const Text('Localizacao de trabalho'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: cidade,
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: bairro,
                    decoration: const InputDecoration(
                      labelText: 'Bairro',
                    ),
                  ),
                  TextField(
                    controller: logradouro,
                    decoration: const InputDecoration(
                      labelText: 'Logradouro',
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state:
                _activeStepIndex <= 3 ? StepState.indexed : StepState.editing,
            isActive: _activeStepIndex >= 3,
            title: const Text('Localizacao Nascimento'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: cidade,
                    decoration: const InputDecoration(
                      labelText: 'Cidade nascimento',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: bairro,
                    decoration: const InputDecoration(
                      labelText: 'Bairro',
                    ),
                  ),
                  TextField(
                    controller: logradouro,
                    decoration: const InputDecoration(
                      labelText: 'Logradouro',
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state:
                _activeStepIndex <= 4 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 4,
            title: const Text('Localizacao Residencial'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: cidade,
                    decoration: const InputDecoration(
                      labelText: 'Cidade residencial',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: bairro,
                    decoration: const InputDecoration(
                      labelText: 'Bairro',
                    ),
                  ),
                  TextField(
                    controller: logradouro,
                    decoration: const InputDecoration(
                      labelText: 'Logradouro',
                    ),
                  ),
                ],
              ),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            print('Submited');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        elevation: 5,
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: controls.onStepContinue,
                child: const Text('SALVAR'),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.green,
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(
                onPressed: controls.onStepCancel,
                child: const Text('VOLTAR'),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 39, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                width: 900,
              ),
              OutlinedButton(
                onPressed: controls.onStepCancel,
                child: const Text('ANTERIOR'),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 39, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(
                onPressed: controls.onStepContinue,
                child: const Text('PROXIMO'),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 39, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
