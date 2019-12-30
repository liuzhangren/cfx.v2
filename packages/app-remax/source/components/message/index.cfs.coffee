import { 
  spacing
  font
  color
  border
  line
  opacity
} from '../../style/variables/default'

export default ({
  cfs: {
    px
    vh
    per: p
    joinS: js
    rgba
    calc
    color: c
  }
}) =>
  atMessage:
    position: 'fixed'
    top: 0
    left: 0
    right: 0
    width: '100%'
    padding: js[
      (spacing {px}).v.sm
      (spacing {px}).h.sm
    ]
    color: '#fff'
    fontSize: px 28
    textAlign: 'center'
    lineHeight: 1.5
    background: '#78A4FA'
    animation: 'ease both'
    transform: translate3d(0, -100%, 0)
    transition: all 300ms $ease-in-sine
    opacity: 0
    zIndex: 1090
    boxSizing: 'border-box'
    '&--success':
      background: '#13CE66'
    '&--error':
        background: '#FF4949'
    '&--warning':
      background: '#FFC82C '
    '&--info':
      background: '#78A4FA'
    '&--show'
      opacity: 1
      transform: 'translate3d(0, 0, 0)'
    '&--hidden' 
      opacity: 0
      transform: 'translate3d(0, -100%, 0)'