import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'
# import { uuid } from '../../common/utils'

import {
  View
  Image
} from 'remax/wechat'

C = CFX {
  View
  Image
}

generateMatrix = (files, col, showAddBtn) =>
  matrix: []
  length: if showAddBtn then files.length + 1 else files.length
  row: Math.ceil(length / col)
  for (let i = 0; i < row; i++)
    if (i === row - 1)  
      lastArr = files.slice(i * col)
      if lastArr.length < col 
        if showAddBtn 
          lastArr.push { type: 'btn', uuid: uuid() }
        for (let j = lastArr.length; j < col; j++) 
          lastArr.push { type: 'blank', uuid: uuid() }
      matrix.push lastArr
    else
      matrix.push(files.slice(i * col, (i + 1) * col))
  return matrix

  ENV = Taro.getEnv()

export default (props) =>
  [
    className
    customStyle
    files
    mode
    length
    showAddBtn
  ] = props
  matrix = generateMatrix(files, length, showAddBtn)
  rootCls = classNames('at-image-picker', className)

  C.View
    className: rootCls
    style: customStyle
  ,
    matrix.map (row,i) =>
      C.View
        className:'at-image-picker__flex-box' 
        key: i + 1
      ,
        row.map (item, j) =>
          if item.url
          then
            C.View
              className: 'at-image-picker__flex-item' 
              key: (i * length) + j
            C.View
              className: 'at-image-picker__item'
            ,
              C.View
                className: 'at-image-picker__remove-btn'
                onClick: handleRemoveImg.bind(this, (i * length) + j)
              C.Image
                className: 'at-image-picker__preview-img'
                mode: mode
                src: item.url
                onClick: handleImageClick.bind(this, (i * length) + j)
          else
            C.View
              className: 'at-image-picker__flex-item'
              key: (i * length) + j
            ,
              item.type === 'btn' and C.View
                className: 'at-image-picker__item at-image-picker__choose-btn'
                onClick: chooseFile
              ,
                C.View
                  className:'add-bar'
                C.View
                  className:'add-bar'



