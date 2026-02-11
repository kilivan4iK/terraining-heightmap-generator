export const isMtTokenValid = () => {
  const { settings } = useMapbox().value
  return settings.accessTokenMT && settings.accessTokenMT !== ''
}

export const isMbTokenValid = () => {
  const { settings } = useMapbox().value
  return settings.accessToken && settings.accessToken !== ''
}
