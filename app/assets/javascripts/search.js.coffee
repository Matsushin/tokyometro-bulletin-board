$ ->
  $('.result').hide()
  success = (position) ->
    $.ajax({
      url: 'search/near_station',
      type:'POST',
      dataType: 'json',
      data : {'lat' : position.coords.latitude, 'lon' : position.coords.longitude },
      timeout:10000,
      success: (data) ->
        select = $('<select>').attr('name', 'railway')
        $.each(data, (index, value) ->
          option = $('<option>').html(value['odpt:stationCode'] + ' ' + value['dc:title']).attr('value', value['owl:sameAs'] + '|' + value['odpt:railway'])
          select.append(option)
        )
        $('#approach-form').prepend(select)
        if data.size <= 0
          $('.result').prepend($('<p>').html('近くに駅がありません'))
        $('.loading').hide()
        $('.result').show()
      ,
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        alert("最寄りの駅の情報取得に失敗しました")
    })

  error = (error) ->
    alert('位置情報の取得に失敗しました')

  if $('#approach-form').size() > 0
    navigator.geolocation.getCurrentPosition(success, error)