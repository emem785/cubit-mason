part '{{cubit_name.snakeCase()}}_state.dart';

@injectable
class {{cubit_name.pascalCase()}}Cubit extends Cubit<{{cubit_name.pascalCase()}}State> {
  final {{repository_name.pascalCase()}}Repository {{repository_name.camelCase()}}Repository;
  {{cubit_name.pascalCase()}}Cubit(this.{{repository_name.camelCase()}}Repository)
      : super({{cubit_name.pascalCase()}}State.initial());

}
