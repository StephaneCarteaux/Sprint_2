db.createCollection('videos', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'videos',
        required: ['author', 'title', 'views', 'description', 'size', 'file_name', 'duration', 'thumbnail', 'state', 'published_on'],
        properties: {
          author: {
            bsonType: 'object',
            title: 'object',
            required: ['user_id', 'username'],
            properties: {
              user_id: {
                bsonType: 'objectId'
              },
              username: {
                bsonType: 'string'
              },
              playlists: {
                bsonType: 'array',
                items: {
                  title: 'object',
                  required: ['name', 'state', 'created_on'],
                  properties: {
                    name: {
                      bsonType: 'string'
                    },
                    state: {
                      enum: ['public', 'private']
                    },
                    videos_id: {
                      bsonType: 'array',
                      items: {
                        bsonType: 'objectId'
                      }
                    },
                    created_on: {
                      bsonType: 'date'
                    }
                  }
                }
              }
            }
          },
          title: {
            bsonType: 'string'
          },
          views: {
            bsonType: 'int'
          },
          suscribers: {
            bsonType: 'int'
          },
          description: {
            bsonType: 'string'
          },
          size: {
            bsonType: 'double'
          },
          file_name: {
            bsonType: 'string'
          },
          duration: {
            bsonType: 'int'
          },
          thumbnail: {
            bsonType: 'binData'
          },
          state: {
            enum: ['public', 'ocult', 'private']
          },
          tags: {
            bsonType: 'array',
            items: {
              bsonType: 'string'
            }
          },
          published_on: {
            bsonType: 'date'
          },
          reactions: {
            bsonType: 'object',
            title: 'object',
            required: ['user_id', 'type', 'date'],
            properties: {
              user_id: {
                bsonType: 'objectId'
              },
              type: {
                enum: ['like', 'dislike']
              },
              date: {
                bsonType: 'date'
              }
            }
          },
          comments: {
            bsonType: 'array',
            items: {
              title: 'object',
              required: ['user_id', 'text', 'date'],
              properties: {
                user_id: {
                  bsonType: 'objectId'
                },
                text: {
                  bsonType: 'string'
                },
                date: {
                  bsonType: 'date'
                }
              }
            }
          }
        }
      }
    }
  });
  db.createCollection('users', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'users',
        required: ['email', 'password', 'username', 'birth_date', 'genre', 'country', 'zip_code'],
        properties: {
          email: {
            bsonType: 'string'
          },
          password: {
            bsonType: 'string',
            description: 'Store hashed password'
          },
          username: {
            bsonType: 'string'
          },
          birth_date: {
            bsonType: 'date'
          },
          genre: {
            enum: ['male', 'female']
          },
          country: {
            bsonType: 'string'
          },
          zip_code: {
            bsonType: 'string'
          },
          channel: {
            bsonType: 'object',
            title: 'object',
            required: ['name', 'description', 'created_on'],
            properties: {
              name: {
                bsonType: 'string'
              },
              description: {
                bsonType: 'string'
              },
              created_on: {
                bsonType: 'date'
              }
            }
          },
          subscriptions: {
            bsonType: 'array',
            items: {
              title: 'object',
              required: ['channels_id'],
              properties: {
                channels_id: {
                  bsonType: 'objectId'
                }
              }
            }
          }
        }
      }
    }
  });
