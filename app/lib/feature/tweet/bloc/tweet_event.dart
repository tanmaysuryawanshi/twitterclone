part of 'tweet_bloc.dart';

@immutable
abstract class TweetEvent {}

class TweetInitialFetchEvent extends TweetEvent {}
