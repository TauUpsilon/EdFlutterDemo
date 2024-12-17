import 'package:eyr/app/app_widget.dart';
import 'package:eyr/featured/home/classes/application.dart';
import 'package:eyr/featured/home/home_cubit.dart';
import 'package:eyr/featured/home/home_state.dart';
import 'package:eyr/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_paramable_annotation/json_paramable_annotation.dart';

part 'home_view.g.dart';

@JsonSerializable(
  ignoreUnannotated: true,
  explicitToJson: true,
)
@JsonParamable()
class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..onInit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HeaderBar(title: AppConfig.appTitle),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns in the grid
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                    childAspectRatio: 0.75,
                  ),
                  itemCount: context.read<HomeCubit>().apps.length,
                  itemBuilder: (context, index) => _buildAppInfoTile(
                    context.read<HomeCubit>().apps[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppInfoTile(Application app) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => GestureDetector(
        onTap: () => context.read<HomeCubit>().onApplicationClicked(app),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Square container for the icon
            Container(
              width: 80, // Width of the box (adjust as needed)
              height: 80, // Height of the box (adjust as needed)
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 4, // Spread effect of shadow
                    blurRadius: 5, // Blur radius of the shadow
                    offset: const Offset(2, 2), // Offset of the shadow (x, y)
                  ),
                ],
              ),
              child: Icon(
                app.icon,
                size: 50, // Size of the app icon
              ),
            ),

            const SizedBox(height: 6),

            Text(
              app.label,
              overflow: TextOverflow.ellipsis, // Truncate with ellipsis
              maxLines: 1, // Only show one line of text
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
