import "package:flutter/material.dart";
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_cronos/models/todo.dart';
import 'package:provider_cronos/providers/app_state.dart';

class SeeTodo extends StatelessWidget {
  static String routeName = "/see-todo";
  const SeeTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<AppState>().todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Toutes les tâches"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              const Gap(30.0),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index) => SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  todos[index].title,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      context.read<AppState>().removeTodo(
                                            todos[index],
                                          ),
                                  child: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20.0),
                            Text(
                              todos[index].content,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
