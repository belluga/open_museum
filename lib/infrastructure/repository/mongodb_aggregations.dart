class MongodbAggregations {
  static List<Map<String, Object>> artworksByLocation({
    required double latitude,
    required double longitude,
    required int maxDistance,
  }) {
    return [
      {
        "\$geoNear": {
          "near": {
            "type": "Point",
            "coordinates": [-20.66927, -40.4926]
          },
          "distanceField": "distance",
          "maxDistance": 1000000,
          "spherical": true
        }
      },
      {
        "\$lookup": {
          "from": "artists",
          "localField": "artists",
          "foreignField": "_id",
          "as": "artists"
        }
      },
      {
        "\$sort": {"distance": 1}
      }
    ];
  }
}
