import "package:flutter/material.dart";
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_cronos/components/custom_text_field.dart';
import 'package:provider_cronos/models/todo.dart';
import 'package:provider_cronos/providers/app_state.dart';
import 'package:provider_cronos/views/see_todo.dart';

class AddTodo extends StatefulWidget {
  static String routeName = "/add-todo";
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController messageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "Titre de la tâche",
                controller: titleCtrl,
              ),
              const Gap(20.0),
              CustomTextField(
                hintText: "Contenu de la tâche",
                controller: messageCtrl,
                maxLine: 4,
              ),
              const Gap(30.0),
              SizedBox(
                width: double.infinity,
                height: 49.0,
                child: ElevatedButton(
                  onPressed: () {
                    String title = titleCtrl.text;
                    String message = messageCtrl.text;

                    print(title);
                    print(message);
                    context.read<AppState>().addTodo(
                          Todo(
                            title: title,
                            content: message,
                          ),
                        );
                    titleCtrl.clear();
                    messageCtrl.clear();
                  },
                  child: Text(
                    "Ajoutez une tâche",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SeeTodo.routeName,
                  );
                },
                child: Text(
                  "Toute les tâches",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
