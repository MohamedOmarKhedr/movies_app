class StarsResponse {
  StarsResponse({
    num? page,
    List<StarsResults>? results,
    num? totalPages,
    num? totalResults,
  }) {
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
  }

  StarsResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(StarsResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<StarsResults>? _results;
  num? _totalPages;
  num? _totalResults;

  num get page => _page ?? 0;
  List<StarsResults> get results => _results ?? [];
  num get totalPages => _totalPages ?? 0;
  num get totalResults => _totalResults ?? 0;
}

class StarsResults {
  StarsResults({
    bool? adult,
    num? gender,
    num? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    num? popularity,
    String? profilePath,
    List<KnownFor>? knownFor,
  }) {
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _knownFor = knownFor;
  }

  StarsResults.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
  }
  bool? _adult;
  num? _gender;
  num? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  num? _popularity;
  String? _profilePath;
  List<KnownFor>? _knownFor;

  bool? get adult => _adult ?? false;
  num? get gender => _gender ?? 0;
  num? get id => _id ?? 0;
  String? get knownForDepartment => _knownForDepartment ?? '';
  String? get name => _name ?? '';
  String? get originalName => _originalName ?? '';
  num? get popularity => _popularity ?? 0;
  String? get profilePath => _profilePath ?? '';
  List<KnownFor>? get knownFor => _knownFor ?? [];
}

class KnownFor {
  KnownFor({
    bool? adult,
    String? backdropPath,
    num? id,
    String? title,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? mediaType,
    List<num>? genreIds,
    num? popularity,
    String? releaseDate,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _id = id;
    _title = title;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _posterPath = posterPath;
    _mediaType = mediaType;
    _genreIds = genreIds;
    _popularity = popularity;
    _releaseDate = releaseDate;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  KnownFor.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _id = json['id'];
    _title = json['title'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _mediaType = json['media_type'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _popularity = json['popularity'];
    _releaseDate = json['release_date'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  num? _id;
  String? _title;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  String? _posterPath;
  String? _mediaType;
  List<num>? _genreIds;
  num? _popularity;
  String? _releaseDate;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;

  bool get adult => _adult ?? false;
  String get backdropPath => _backdropPath ?? '';
  num get id => _id ?? 0;
  String get title => _title ?? '';
  String get originalLanguage => _originalLanguage ?? '';
  String get originalTitle => _originalTitle ?? '';
  String get overview => _overview ?? '';
  String get posterPath => _posterPath ?? '';
  String get mediaType => _mediaType ?? '';
  List<num> get genreIds => _genreIds ?? [];
  num get popularity => _popularity ?? 0;
  String get releaseDate => _releaseDate ?? '';
  bool get video => _video ?? false;
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;
}
