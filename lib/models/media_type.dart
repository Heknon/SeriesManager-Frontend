enum MediaType { Multi, Tv, Movie }

MediaType getMediaType(String string) {
  switch (string.toLowerCase()) {
    case "multi":
      return MediaType.Multi;
    case "tv":
      return MediaType.Tv;
    case "movie":
      return MediaType.Movie;
  }
}
