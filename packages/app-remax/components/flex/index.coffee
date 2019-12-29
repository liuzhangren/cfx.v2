<<<<<<< HEAD:packages/app-remax/source/components/flex/index.coffee
import React, { useState, useEffect} from React
=======
import React, { useState, useEffect} from 'react'
>>>>>>> origin/member/zhangren:packages/app-remax/components/flex/index.coffee
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _forEach from 'lodash/forEach'

# import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  rootClass = ['at-row']

  _forEach props, (value,key) =>
    if key === 'children'
      return
    if key === 'alignContent'
      return rootClass.push "at-row--#{value}"
    if key === 'alignContent'
      return rootClass.push "at-row__align-content--#{value}"
    rootClass.push "at-row__#{key}--#{value}"
  
  C.View
    className: rootClass
  , props.children