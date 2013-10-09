/*
 * File: app/controller/MyController.js
 *
 * This file was generated by Sencha Architect version 2.2.2.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Sencha Touch 2.2.x library, under independent license.
 * License of Sencha Architect does not include license for Sencha Touch 2.2.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('MyApp.controller.MyController', {
    extend: 'Ext.app.Controller',

    config: {
        refs: {
            signUpsignInCardPanel: 'signUpsignInCardPanel'
        },

        control: {
            "panel": {
                signUpSuccess: 'onSignUpsignInCardPanelSignUpSuccess',
                signInSuccess: 'onSignUpsignInCardPanelSignInSuccess'
            }
        }
    },

    onSignUpsignInCardPanelSignUpSuccess: function(panel) {
        alert('signUpSuccess fired. This event should be honored in main application');
    },

    onSignUpsignInCardPanelSignInSuccess: function(panel) {
        alert('sign In Success fired. This event should be honored in main application');

        var signUpsignInCardPanel = this.getsignUpsignInCardPanel();
        alert(signUpsignInCardPanel);
        var dummyUserAppPanel = signUpsignInCardPanel.down('#dummyUserAppPanel');
        signUpsignInCardPanel.setActiveItem(dummyUserAppPanel);
    }

});