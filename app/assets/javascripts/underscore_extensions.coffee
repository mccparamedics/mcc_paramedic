_.inGroupsOf = (array, count) ->
  finalArray = []
  tmpArray = []
  for value in array
    tmpArray.push value
    if tmpArray.length == count
      finalArray.push tmpArray
      tmpArray = []
  if tmpArray.length > 0
    finalArray.push tmpArray
  finalArray
