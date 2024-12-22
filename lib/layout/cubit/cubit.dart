import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/layout/cubit/states.dart';

class PetsCupit extends Cubit
{
PetsCupit () : super(Initialstate);

static PetsCupit get(context)=>BlocProvider.of(context);
}