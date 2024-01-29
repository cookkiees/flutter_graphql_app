import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // Buat client GraphQL
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink('https://countries.trevorblades.com/'),
  );

  // Buat query
  String query = '''
    query ExampleQuery {
        country(code :"AE"){
        name
      }
    }
''';
  final queryOptions = QueryOptions(
    document: gql(query),
  );
  try {
    final result = await client.query(queryOptions);

    final countryName = result.data?['country']['name'];
    debugPrint("Country Name: $countryName");
  } catch (error) {
    debugPrint("Error: $error");
  }
}
