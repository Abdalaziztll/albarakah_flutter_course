import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  'https://graphql-teas-endpoint.netlify.app/',
);

GraphQLClient req = GraphQLClient(
  link: httpLink,
  // The default store is the InMemoryStore, which does NOT persist to disk
  cache: GraphQLCache(store: HiveStore()),
);

getData() async{
  QueryOptions options = QueryOptions(document: gql("""query allTea {
  teas{
    name
  }
}"""));

 QueryResult result =await req.query(options);

//  print(result.data!['teas'][0]['name']);

 print(result.data!['teas']);
}
