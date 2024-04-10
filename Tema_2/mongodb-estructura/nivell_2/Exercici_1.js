db.createCollection('order', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'order',
        required: ['shop', 'date_time', 'delivery', 'products', 'client', 'total_price'],
        properties: {
          shop: {
            bsonType: 'object',
            title: 'object',
            required: ['shop_id', 'name'],
            properties: {
              shop_id: {
                bsonType: 'objectId'
              },
              name: {
                bsonType: 'string'
              }
            }
          },
          date_time: {
            bsonType: 'date'
          },
          delivery: {
            bsonType: 'object',
            title: 'object',
            required: ['home_delivery', 'employee', 'delivered_on', 'delivered_in'],
            properties: {
              home_delivery: {
                bsonType: 'bool'
              },
              employee: {
                bsonType: 'objectId'
              },
              delivered_on: {
                bsonType: 'date'
              },
              delivered_in: {
                bsonType: 'object',
                title: 'object',
                required: ['street', 'number', 'contact_number'],
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
                  contact_number: {
                    bsonType: 'string'
                  }
                }
              }
            }
          },
          products: {
            bsonType: 'array',
            items: {
              title: 'object',
              required: ['product_id', 'quantity', 'name', 'description', 'price'],
              properties: {
                product_id: {
                  bsonType: 'objectId'
                },
                quantity: {
                  bsonType: 'decimal'
                },
                name: {
                  bsonType: 'string'
                },
                description: {
                  bsonType: 'string'
                },
                price: {
                  bsonType: 'double'
                }
              }
            }
          },
          client: {
            bsonType: 'object',
            title: 'object',
            required: ['client_id', 'name'],
            properties: {
              client_id: {
                bsonType: 'objectId'
              },
              name: {
                bsonType: 'string'
              }
            }
          },
          total_price: {
            bsonType: 'double'
          },
          note: {
            bsonType: 'string'
          }
        }
      }
    }
  });
  db.createCollection('client', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'client',
        required: ['name', 'last_name_1', 'address', 'phone'],
        properties: {
          name: {
            bsonType: 'string'
          },
          last_name_1: {
            bsonType: 'string'
          },
          last_name_2: {
            bsonType: 'string'
          },
          address: {
            bsonType: 'object',
            title: 'object',
            required: ['street', 'number', 'zip_code', 'city', 'province'],
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
              zip_code: {
                bsonType: 'string'
              },
              city: {
                bsonType: 'string'
              },
              province: {
                bsonType: 'string'
              }
            }
          },
          phone: {
            bsonType: 'string'
          }
        }
      }
    }
  });
  db.createCollection('product', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'product',
        properties: {
          category: {
            enum: ['pizza', 'hamburger', 'drink']
          },
          pizza_cat_id: {
            bsonType: 'objectId'
          },
          name: {
            bsonType: 'string'
          },
          description: {
            bsonType: 'string'
          },
          image: {
            bsonType: 'binData'
          },
          price: {
            bsonType: 'double'
          }
        }
      }
    }
  });
  db.createCollection('pizza_cat', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'pizza_cat',
        required: ['name'],
        properties: {
          name: {
            bsonType: 'string'
          }
        }
      }
    }
  });
  db.createCollection('shop', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'shop',
        required: ['name', 'address'],
        properties: {
          name: {
            bsonType: 'string'
          },
          address: {
            bsonType: 'object',
            title: 'object',
            required: ['street', 'zip_code', 'city', 'province'],
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
              zip_code: {
                bsonType: 'string'
              },
              city: {
                bsonType: 'string'
              },
              province: {
                bsonType: 'string'
              }
            }
          },
          employee: {
            bsonType: 'array',
            items: {
              title: 'object',
              required: ['name', 'last_name_1', 'nif', 'phone', 'role'],
              properties: {
                name: {
                  bsonType: 'string'
                },
                last_name_1: {
                  bsonType: 'string'
                },
                last_name_2: {
                  bsonType: 'string'
                },
                nif: {
                  bsonType: 'string'
                },
                phone: {
                  bsonType: 'string'
                },
                role: {
                  enum: ['kitchener', 'delivery']
                }
              }
            }
          }
        }
      }
    }
  });
