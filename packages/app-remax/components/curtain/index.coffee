import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  [
    className
    customStyle
    isOpened
    closeBtnPosition
  ] = props

  curtainClass = 
    classNames {
      'at-curtain': true,
      'at-curtain--closed': !isOpened
    }, className
  
  btnCloseClass = 
    classNames {
      'at-curtain__btn-close': true,
      ["at-curtain__btn-close--#{closeBtnPosition}"]: closeBtnPosition
    }

  C.View
    className: curtainClass
    style: customStyle
    onClick: _stopPropagation
  , 
    C.View
      className: 'at-curtain__container'
    ,
      C.View
        className: 'at-curtain__body'
      , props.children
      ,
        C.View
          className: btnCloseClass
          onClick: onClose.bind this
        