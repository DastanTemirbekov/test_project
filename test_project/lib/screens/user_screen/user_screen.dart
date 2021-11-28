//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//local
import 'package:test_project/components/error_screen.dart';
import 'package:test_project/components/loading_indicator.dart';
import 'package:test_project/screens/detail_screen/detail_screen.dart';
import 'package:test_project/screens/user_screen/bloc/user_repository.dart';
import 'bloc/user_bloc.dart';
import 'model/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    bloc.add(GetUserEvent());
    super.initState();
  }

  final bloc = UserBloc(UserRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users'),
      ),
      body: BlocConsumer<UserBloc, UserBlocState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is UserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message.message!),
              duration: const Duration(seconds: 3),
            ));
          }
        },
        builder: (context, state) {
          if (state is UserLoadingState) {
            return loadingIndicator();
          } else if (state is UserLoadedState) {
            return contentScreen(context, state.model!);
          } else if (state is UserErrorState) {
            return ErrorScreen(onTap: () => bloc.add(GetUserEvent()));
          }
          return loadingIndicator();
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}

Widget contentScreen(BuildContext context, List<UserModel> model) {
  return Container(
    padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
    child: ListView.builder(
      itemExtent: 75,
      itemCount: model.length,
      itemBuilder: (_, index) => Card(
        color: Colors.grey[300],
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                //id: model[index].id!,
                name: model[index].name,
                username: model[index].username,
                email: model[index].email,
                phone: model[index].phone,
                adress: model[index].address!.city,
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i2.wp.com/www.cssscript.com/wp-content/uploads/2020/12/Customizable-SVG-Avatar-Generator-In-JavaScript-Avataaars.js.png?fit=438%2C408&ssl=1'),
            radius: 20,
          ),
          title: Text(model[index].name!),
        ),
      ),
    ),
  );
}
