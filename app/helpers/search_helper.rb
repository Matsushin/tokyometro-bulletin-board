module SearchHelper
  TRAIN_TYPE_LIST = {
    'odpt.TrainType:TokyoMetro.Local'          => '各停',
    'odpt.TrainType:TokyoMetro.Express'        => '急行',
    'odpt.TrainType:TokyoMetro.Rapid'          => '快速',
    'odpt.TrainType:TokyoMetro.LimitedExpress' => '特急',
  }

  RAIL_DIRECTION_LIST = {
    'odpt.RailDirection:TokyoMetro.Asakusa'         => '浅草',      # 銀座線
    'odpt.RailDirection:TokyoMetro.Shibuya'         => '渋谷',      # 銀座線
    'odpt.RailDirection:TokyoMetro.Ikebukuro'       => '池袋',      # 丸ノ内線
    'odpt.RailDirection:TokyoMetro.Ogikubo'         => '荻窪',      # 丸ノ内線
    'odpt.RailDirection:TokyoMetro.NakanoSakaue'    => '中野坂上',   # 丸ノ内線（分岐線）
    'odpt.RailDirection:TokyoMetro.Honancho'        => '方南町',    # 丸ノ内線（分岐線）
    'odpt.RailDirection:TokyoMetro.KitaSenju'       => '北千住',    # 日比谷線
    'odpt.RailDirection:TokyoMetro.NakaMeguro'      => '中目黒',    # 日比谷線
    'odpt.RailDirection:TokyoMetro.Nakano'          => '中野',      # 東西線
    'odpt.RailDirection:TokyoMetro.NishiFunabashi'  => '西船橋',    # 東西線
    'odpt.RailDirection:TokyoMetro.Ayase'           => '綾瀬',      # 千代田線
    'odpt.RailDirection:TokyoMetro.YoyogiUehara'    => '代々木上原', # 千代田線
    'odpt.RailDirection:TokyoMetro.KitaAyase'       => '北綾瀬',    # 千代田線（支線）
    'odpt.RailDirection:TokyoMetro.Ayase'           => '綾瀬',      # 千代田線（支線）
    'odpt.RailDirection:TokyoMetro.Wakoshi'         => '和光市',    # 有楽町線
    'odpt.RailDirection:TokyoMetro.ShinKiba'        => '新木場',    # 有楽町線
    'odpt.RailDirection:TokyoMetro.Shibuya'         => '渋谷',      # 半蔵門線
    'odpt.RailDirection:TokyoMetro.Oshiage'         => '押上',      # 半蔵門線
    'odpt.RailDirection:TokyoMetro.Meguro'          => '目黒',      # 南北線
    'odpt.RailDirection:TokyoMetro.AkabaneIwabuchi' => '赤羽岩淵',  # 南北線
    'odpt.RailDirection:TokyoMetro.Wakoshi'         => '和光市',    # 副都心線
    'odpt.RailDirection:TokyoMetro.Shibuya'         => '渋谷',     # 副都心線
  }

  # 列車種別の名称取得
  def get_train_type_name(train_type)
    TRAIN_TYPE_LIST[train_type]
  end

  # 列車方面の名称取得
  def get_rail_direction_name(rail_direction)
    RAIL_DIRECTION_LIST[rail_direction]
  end
end
