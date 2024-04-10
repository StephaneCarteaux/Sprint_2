db.createCollection('customer', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'customer',
      required: ['name', 'register_on'],
      properties: {
        name: {
          bsonType: 'string'
        },
        address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'city', 'zip_code', 'country'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'string'
            },
            floor: {
              bsonType: 'string'
            },
            door: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            zip_code: {
              bsonType: 'string'
            },
            country: {
              bsonType: 'string'
            }
          }
        },
        phone: {
          bsonType: 'string'
        },
        email: {
          bsonType: 'string'
        },
        register_on: {
          bsonType: 'date'
        },
        recommended_by: {
          bsonType: 'objectId'
        },
        orders: {
          bsonType: 'array',
          items: {
            title: 'object',
            required: ['glasses_id', 'brand', 'graduation_l', 'graduation_r', 'glass_color_l', 'glass_color_r', 'frame_type', 'price', 'emloyee', 'sold_on'],
            properties: {
              glasses_id: {
                bsonType: 'objectId'
              },
              brand: {
                bsonType: 'string'
              },
              graduation_l: {
                bsonType: 'double'
              },
              graduation_r: {
                bsonType: 'double'
              },
              glass_color_l: {
                bsonType: 'string'
              },
              glass_color_r: {
                bsonType: 'string'
              },
              frame_type: {
                enum: ['float', 'pasta', 'metalic']
              },
              price: {
                bsonType: 'double'
              },
              emloyee: {
                bsonType: 'string'
              },
              sold_on: {
                bsonType: 'date'
              }
            }
          }
        }
      }
    }
  }
});
db.createCollection('provider', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'provider',
      required: ['name', 'address', 'phone', 'nif'],
      properties: {
        name: {
          bsonType: 'string'
        },
        address: {
          bsonType: 'object',
          title: 'object',
          required: ['street', 'city', 'zip_code', 'country'],
          properties: {
            street: {
              bsonType: 'string'
            },
            number: {
              bsonType: 'string'
            },
            floor: {
              bsonType: 'string'
            },
            door: {
              bsonType: 'string'
            },
            city: {
              bsonType: 'string'
            },
            zip_code: {
              bsonType: 'string'
            },
            country: {
              bsonType: 'string'
            }
          }
        },
        phone: {
          bsonType: 'string'
        },
        fax: {
          bsonType: 'string'
        },
        nif: {
          bsonType: 'string'
        }
      }
    }
  }
});
db.createCollection('glasses', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'glasses',
      required: ['brand', 'graduation_l', 'graduation_r', 'frame_type', 'frame_color', 'glass_color_l', 'glass_color_r', 'price'],
      properties: {
        provider_id: {
          bsonType: 'objectId'
        },
        brand: {
          bsonType: 'string'
        },
        graduation_l: {
          bsonType: 'double'
        },
        graduation_r: {
          bsonType: 'double'
        },
        frame_type: {
          enum: ['float', 'pasta', 'metalic']
        },
        frame_color: {
          bsonType: 'string'
        },
        glass_color_l: {
          bsonType: 'string'
        },
        glass_color_r: {
          bsonType: 'string'
        },
        price: {
          bsonType: 'double'
        }
      }
    }
  }
});
