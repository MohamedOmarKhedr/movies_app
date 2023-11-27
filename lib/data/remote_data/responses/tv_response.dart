class TVResponse {
  TVResponse({
    num? page,
    List<TVResults>? results,
    num? totalPages,
    num? totalResults,
  }) {
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
  }

  TVResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(TVResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<TVResults>? _results;
  num? _totalPages;
  num? _totalResults;

  num get page => _page ?? 0;
  List<TVResults> get results => _results ?? [];
  num get totalPages => _totalPages ?? 0;
  num get totalResults => _totalResults ?? 0;
}

class TVResults {
  TVResults({
    bool? adult,
    String? backdropPath,
    List<num>? genreIds,
    num? id,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    num? popularity,
    String? posterPath,
    String? firstAirDate,
    String? name,
    num? voteAverage,
    num? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _firstAirDate = firstAirDate;
    _name = name;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  TVResults.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _firstAirDate = json['first_air_date'];
    _name = json['name'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<num>? _genreIds;
  num? _id;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _firstAirDate;
  String? _name;
  num? _voteAverage;
  num? _voteCount;

  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<num>? get genreIds => _genreIds;
  num? get id => _id;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  String? get firstAirDate => _firstAirDate;
  String? get name => _name;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;
}
