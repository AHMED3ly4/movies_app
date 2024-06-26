
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/shared/data/movie.dart';

class FirebaseUtils{
  static CollectionReference <Movie> getWatchListCollection(){
    final db = FirebaseFirestore.instance;
    return db.collection('watchListMovies').withConverter(
      fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()),
      toFirestore: (movie, options) =>movie.toJson(),
    );
  }


  static Future<void> addMovieToWatchList(Movie movie)async {
    final collectionReference =getWatchListCollection();
    final doc =collectionReference.doc(movie.id.toString());
    return doc.set(movie);
  }



  static Future<void> deleteMovieFromWatchList(int movieId){
    final collectionReference =getWatchListCollection();
    final doc =collectionReference.doc(movieId.toString());
    return doc.delete();
  }

  static Future<List<Movie>> getWatchListMovies()async{
    final collectionReference =getWatchListCollection();
    final querySnapshot =await collectionReference.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

}