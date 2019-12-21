import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _chunk from 'lodash/chunk'
import _isObject from 'lodash/isObject'
import _isFunction from 'lodash/isFunction'

# import AtComponent from '../../common/component'

import {
  View
  Text
  Image
} from 'remax/wechat'

C = CFX {
  View
  Text
  Image
}

export default (props) =>
  C.View
    className:
      classNames('at-grid',props.className)
  ,
    gridGroup.map (item, i) =>
      C.View
        className: 'at-grid__flex'
        key: "at-grid-group-#{i}"
      ,
        item.map (item,i) =>
          C.View
            key:"at-grid-item-#{index}"
            className:
              classNames bodyClass,{
                'at-grid-item--last': index === columnNum - 1
              }
            onClick: handleClick.bind(this, childItem, index, i)
            style:
              flex: "0 0 #{100/columnNum}%"
          ,
            C.View
              className: 'at-grid-item__content'
            , 
              C.View
                className: 'at-grid-item__content-inner'
              ,
                C.View
                  className: 'content-inner__icon'
                ,
                  childItem.image and C.Image
                    className: 'content-inner__img'
                    src: childItem.image
                    mode: 'scaleToFill'
                  _isObject childItem.iconInfo and !childItem.image and C.Text
                    className:
                      classNames(
                        childItem.iconInfo.prefixClass || 'at-icon',
                        {
                          ["#{childItem.iconInfo.prefixClass ||
                            'at-icon'}-#{
                            childItem.iconInfo.value
                          }"]: childItem.iconInfo.value
                        },
                        childItem.iconInfo.className
                      ) 
                    style: mergeStyle {
                      color: childItem.iconInfo.color
                      fontSize: "#{childItem.iconInfo.size || 24}px"
                    },
                    childItem.iconInfo.customStyle
                  C.Text
                    classNames: 'content-inner__text'
                  , childItem.value
