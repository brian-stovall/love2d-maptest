return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "2016-01-14",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 10,
  properties = {},
  tilesets = {
    {
      name = "mountain_landscape",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../assets/mountain_landscape.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 256,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "ground",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        95, 96, 79, 79, 80, 95, 80, 96, 80, 95, 96, 95, 80, 80, 95, 95, 79, 79, 80, 80,
        96, 80, 96, 96, 79, 80, 95, 80, 80, 96, 80, 80, 96, 79, 96, 96, 79, 79, 95, 95,
        79, 96, 96, 79, 95, 80, 95, 80, 79, 96, 80, 80, 79, 96, 95, 95, 95, 96, 79, 80,
        96, 96, 96, 80, 95, 96, 96, 95, 80, 96, 79, 95, 95, 96, 95, 96, 96, 80, 95, 80,
        80, 80, 95, 80, 96, 79, 96, 79, 79, 95, 96, 80, 96, 95, 95, 80, 80, 96, 96, 95,
        95, 79, 79, 95, 96, 96, 96, 96, 80, 95, 80, 95, 80, 79, 79, 79, 95, 80, 80, 96,
        80, 79, 79, 79, 79, 95, 96, 79, 95, 96, 96, 96, 80, 80, 79, 96, 79, 80, 80, 96,
        95, 96, 79, 95, 96, 96, 96, 96, 96, 80, 80, 96, 80, 79, 96, 79, 96, 96, 79, 79,
        96, 80, 80, 95, 80, 95, 96, 95, 95, 80, 80, 80, 79, 80, 95, 96, 96, 96, 96, 96,
        79, 95, 96, 80, 95, 95, 95, 95, 96, 95, 80, 79, 96, 79, 80, 95, 95, 96, 80, 96,
        95, 80, 79, 96, 79, 79, 80, 79, 79, 79, 79, 96, 79, 80, 80, 79, 95, 80, 80, 95,
        95, 96, 80, 95, 95, 96, 80, 96, 80, 95, 79, 79, 96, 96, 96, 95, 95, 96, 96, 79,
        96, 80, 79, 80, 95, 95, 79, 79, 80, 79, 79, 95, 79, 79, 95, 80, 80, 96, 80, 95,
        95, 95, 96, 95, 80, 96, 96, 96, 95, 79, 96, 80, 95, 95, 80, 96, 79, 79, 79, 95,
        79, 95, 80, 95, 79, 95, 80, 96, 96, 79, 79, 80, 80, 80, 96, 80, 80, 95, 80, 96,
        79, 95, 95, 96, 79, 95, 80, 79, 95, 79, 96, 80, 80, 79, 80, 96, 95, 80, 79, 80,
        95, 79, 79, 96, 79, 96, 96, 95, 80, 95, 95, 95, 80, 96, 80, 79, 79, 95, 80, 79,
        80, 96, 95, 95, 79, 95, 79, 95, 79, 96, 96, 79, 80, 96, 80, 95, 80, 96, 95, 80,
        95, 80, 95, 96, 95, 80, 79, 96, 95, 79, 80, 96, 80, 95, 80, 95, 96, 79, 79, 80,
        96, 79, 80, 79, 95, 79, 80, 95, 96, 79, 96, 79, 95, 96, 96, 95, 79, 80, 80, 96
      }
    },
    {
      type = "tilelayer",
      name = "walls",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        35, 36, 37, 36, 37, 35, 36, 37, 36, 37, 34, 35, 36, 37, 34, 35, 34, 34, 35, 36,
        66, 67, 68, 66, 67, 68, 50, 51, 52, 53, 50, 50, 51, 50, 51, 52, 50, 51, 52, 53,
        84, 85, 82, 83, 84, 82, 66, 67, 68, 69, 82, 83, 84, 85, 84, 84, 82, 83, 84, 85,
        100, 101, 98, 99, 100, 98, 82, 83, 84, 85, 98, 99, 100, 101, 100, 101, 98, 99, 100, 101,
        0, 0, 0, 0, 0, 97, 98, 99, 100, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 117, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 133, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "rightwall",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 33,
        0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 65,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81
      }
    },
    {
      type = "objectgroup",
      name = "playerStart",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      name = "blocked",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "ellipse",
          x = 178,
          y = 356,
          width = 30,
          height = 23,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 14,
          y = 104,
          width = 166,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 181,
          y = 126,
          width = 135,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 332,
          y = 113,
          width = 214,
          height = 10,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 311,
          y = 113,
          width = 23,
          height = 10,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 546,
          y = 114,
          width = 86,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 631,
          y = 105,
          width = 10,
          height = 536,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
