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
            "coordinates": [latitude, longitude]
          },
          "distanceField": "distance",
          "maxDistance": maxDistance,
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
