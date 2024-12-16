import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';

class MoviesWatchListFirebaseDataSource {
  CollectionReference<MovieFav> getMoviesCollection() =>
      FirebaseFirestore.instance.collection('movies').withConverter<MovieFav>(
            fromFirestore: (docSnapshot, options) =>
                MovieFav.fromJson(docSnapshot.data()!),
            toFirestore: (movieFav, options) => movieFav.toJson(),
          );

  Future<void> addMovieToFireStore(MovieFav movie) async {
    CollectionReference<MovieFav> moviesCollection = getMoviesCollection();
    DocumentReference<MovieFav> doc = moviesCollection.doc('${movie.id}');
    return doc.set(movie);
  }

  Future<void> removeMovieToFireStore(MovieFav movie) async {
    CollectionReference<MovieFav> moviesCollection = getMoviesCollection();
    DocumentReference<MovieFav> doc = moviesCollection.doc('${movie.id}');
    return doc.delete();
  }

  Future<List<MovieFav>> getMoviesToFireStore() async {
    CollectionReference<MovieFav> moviesCollection = getMoviesCollection();
    QuerySnapshot<MovieFav> doc = await moviesCollection.get();
    return doc.docs
        .map(
          (docSnapshot) => docSnapshot.data(),
        )
        .toList();
  }
}
