import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _isFunction from 'lodash/isFunction'

# import AtModalHeader from './header/index'
# import AtModalAction from './action/index'
# import AtModalContent from './content/index'
# import AtComponent from '../../common/component'
# import { handleTouchScroll } from '../../common/utils'

import {
  View
  Button
  Text
} from 'remax/wechat'

C = CFX {
  View
  Button
  Text
  AtModalHeader
}

export default (props) =>
  [
    _isOpened
    isWEB
  ] = state

  [
    title
    content
    cancelText
    confirmText
  ] = props
  rootClass =
    classNames 'at-modal',{'at-modal--active': _isOpened},props.className

  if title || content
  then isRenderAction = cancelText || confirmText
    C.View
      className: rootClass
    ,
      C.View
        onClick: handleClickOverlay
        className: 'at-modal__overlay'
      C.View
        className='at-modal__container'
      ,
        title and C.AtModalHeader {}
        ,
          C.Text {}
          ,title
        content and C.AtModalContent {}
        ,
          C.View
            className: 'content-simple'
          , 
            if isWEB then C.Text
              dangerouslySetInnerHTML={ __html: content.replace(/\n/g, '<br/>') }>
            else C.Text {}
            , content
        isRenderAction and C.AtModalAction {
          isSimple
        }
        ,
          cancelText and C.Button
            onClick: handleCancel
          , cancelText
          confirmText and C.Button
            onClick: handleConfirm
          , confirmText

    C.View
      onTouchMove: handleTouchMove 
      className: rootClass  
    ,
      C.View
        className: 'at-modal__overlay'
        onClick: handleClickOverlay
      C.View
        className: 'at-modal__container'
      , props.children
