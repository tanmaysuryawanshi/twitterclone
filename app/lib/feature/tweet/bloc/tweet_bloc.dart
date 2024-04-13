import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/tweet_model.dart';
import '../repo/tweet_repo.dart';

part 'tweet_event.dart';
part 'tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {
  TweetBloc() : super(TweetInitial()) {
    on<TweetInitialFetchEvent>(tweetInitialFetchEvent);
  }

  FutureOr<void> tweetInitialFetchEvent(
      TweetInitialFetchEvent event, Emitter<TweetState> emit) async {
    emit(TweetsLoadState());
    List<TweetModel> tweets = await TweetRepo.getAllTweets();
    emit(TweetsSuccessState(tweets: tweets));
  }
}
