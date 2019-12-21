import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
}

export default (props) =>
  [
    customStyle
    className
    options
    value
  ] = props
  
  C.View
    className: classNames 'at-radio',classname
    style: customStyle
  ,
    options.map option => C.View
      key: option.value
      onClick: handleClick.bind(this, option)
      className: 
        classNames {
          'at-radio__option': true
          'at-radio__option--disabled': option.disabled
        }
    ,
      C.View
        className: 'at-radio__option-wrap'
      ,
        C.View
          className='at-radio__option-container'
        ,
          C.View
            className='at-radio__title'
          , option.label
          C.View
            className:
              classNames {
                'at-radio__icon': true
                'at-radio__icon--checked': value === option.value
              }
          ,
            C.Text
              className: 'at-icon at-icon-check'
        option.desc and C.View
          className: 'at-radio__desc'
        , option.desc
