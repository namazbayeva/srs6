import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srs5/model/profile_user.dart';
import 'package:srs5/profile/bloc/profile_bloc.dart';



class ThirdPage extends StatefulWidget {
  const ThirdPage ({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();

  
}

class _ThirdPageState extends State<ThirdPage> {
  late ProfileBloc profileBloc;
  ProfileUser? profileUser;

  @override
  void initState() {
    profileBloc = ProfileBloc();
    profileBloc.add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: profileBloc,
        listener: (context, state) {
          print("hererrer $state");
          if (state is FailureProfileState) {
            return;
          }
        },
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return Center(child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          if (state is LoadedProfileState) {
            profileUser = state.profileUser;
            print(">>>>>>>>>>>>>$profileUser");
          }
          return Container(
            color: Colors.white,
            child: Center(
              child: Text(
                "${profileUser?.id}",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
