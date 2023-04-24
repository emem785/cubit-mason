part of '{{cubit_name.snakeCase()}}_cubit.dart';

class {{cubit_name.pascalCase()}}Data extends Equatable {
  {{#properties}}
  final {{type}} {{name}};
  {{/properties}}

  {{cubit_name.pascalCase()}}Data({
    {{#properties}}
    this.{{name.camelCase()}},
    {{/properties}}
  });

  {{cubit_name.pascalCase()}}Data.empty()
      : this(
      {{#properties}}
      {{name.camelCase()}} = {{initialValue}},
      {{/properties}}
      );

  @override
  List<Object?> get props {
    return [
      {{#properties}}
      {{name.camelCase()}},
      {{/properties}}
    ];
  }

  {{cubit_name.pascalCase()}}Data copyWith({
  {{#properties}}
   {{type}} {{name}},
  {{/properties}}
  }) {
    return {{cubit_name.pascalCase()}}Data(
  {{#properties}}
    {{name.camelCase()}}: {{name}} ?? this.{{name.camelCase()}},
  {{/properties}}
    );
  }
}

class {{cubit_name.pascalCase()}}State extends Equatable {
  final {{cubit_name.pascalCase()}}Data data;
  final {{cubit_name.pascalCase()}}Status {{cubit_name.camelCase()}}Status;
  const {{cubit_name.pascalCase()}}State(this.data, this.{{cubit_name.camelCase()}}Status);

  {{cubit_name.pascalCase()}}State.initial()
      : this({{cubit_name.pascalCase()}}Data.empty(), {{cubit_name.pascalCase()}}Status.idle);

  @override
  List<Object> get props => [data, {{cubit_name.camelCase()}}Status];

  TResult maybeWhen<TResult extends Object?>({
    {{#states}}
    TResult Function({{cubit_name.pascalCase()}}State state)? {{.}},
    {{/states}}
    required TResult Function()? orElse,
  }) {
    late MaybeActionMap<{{cubit_name.pascalCase()}}State, {{cubit_name.pascalCase()}}Status> _maybeWhenMap;
    _maybeWhenMap = {
    {{#states}}
      {{cubit_name.pascalCase()}}Status.{{.}}: {{.}},
    {{/states}}
    };
    final maybeAction = _maybeWhenMap[{{cubit_name.camelCase()}}Status];
    return (maybeAction != null ? maybeAction(this) : orElse!()) as TResult;
  }

  {{cubit_name.pascalCase()}}State copyWith({
    {{cubit_name.pascalCase()}}Data? data,
    {{cubit_name.pascalCase()}}Status? {{cubit_name.camelCase()}}Status,
  }) {
    return {{cubit_name.pascalCase()}}State(
      data ?? this.data,
      {{cubit_name.camelCase()}}Status ?? this.{{cubit_name.camelCase()}}Status,
    );
  }
}
