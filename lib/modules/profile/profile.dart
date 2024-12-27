import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pets_app/layout/cubit/states.dart';
import '../../layout/cubit/cubit.dart';
import '../cart/cart.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DataCubit(InitialDataState()),
      child: BlocConsumer<DataCubit,DataStates>(
        listener: (context,state) {  },
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black
            )),
            backgroundColor: HexColor('#F0D0B8'),
          ),
          body: Stack(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage:
                        AssetImage('assets/images/profile_placeholder.png'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      //DataCubit.get(context).firstName ?? 'No Name',
                      'Mariam Alaa',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'mariamalaa@gmail.com',
                      //DataCubit.get(context).email ?? 'No Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildProfileCard(
                            icon: Icons.phone,
                            title: 'Phone Number',
                            subtitle: '123456',//DataCubit.get(context).phone_num ?? 'No Phone Number',
                            context: context,
                          ),
                          _buildProfileCard(
                            icon: Icons.location_on,
                            title: 'Address',
                            subtitle: 'Cairo,Egypt',//DataCubit.get(context).address ?? 'No Address',
                            context: context,
                          ),
                          _buildProfileCard(
                            icon: Icons.shopping_cart,
                            title: 'Orders',
                            subtitle: 'View your order history',
                            context: context,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      icon: Icon(Icons.logout, color: Colors.white),
                      label: Text('Logout', style: TextStyle(fontSize: 18,
                          color: Colors.white
                      ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
        },
      ),
    );
  }
  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required BuildContext context,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: HexColor('#F0D0B8'),
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: onTap != null
            ? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black)
            : null,
      ),
    );
  }
}
