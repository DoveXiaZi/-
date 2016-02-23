/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var react = require('react-native');

var {
 AppRegistry,
  Image, 
  StyleSheet, 
  Text, 
  View
} = React;

var TextReactNative = react.createClass({
  render: function() {
    return (
      <View style={styles.row}>
        <Image
          source={{uri: 'http://facebook.github.io/react/img/logo_og.png'}}
          style={styles.image}
        />
        <View style={styles.text}>
          <Text style={styles.title}>
            React Native
          </Text>
          <Text style={styles.subtitle}>
            Build high quality mobile apps using React
          </Text>
        </View>
</View> );
}, });
var styles = StyleSheet.create({
  row: { flexDirection: 'row', margin: 40 },
  image: { width: 40, height: 40, marginRight: 10 },
  text: { flex: 1, justifyContent: 'center'},
  title: { fontSize: 11, fontWeight: 'bold' },
  subtitle: { fontSize: 10 },
});
AppRegistry.registerComponent('TextReactNative', () => TextReactNative);
