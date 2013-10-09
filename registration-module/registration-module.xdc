{
    "xdsVersion": "2.2.2",
    "frameworkVersion": "touch22",
    "internals": {
        "type": "Ext.Panel",
        "reference": {
            "name": "items",
            "type": "array"
        },
        "codeClass": null,
        "userConfig": {
            "registrationUrl": "http://localhost:8080/tusers",
            "base64JsLocation": "static/js/Base64.js",
            "itemId": "registrationCardPanelItemId",
            "designer|userClassName": "RegistrationCardPanel",
            "designer|userAlias": "registrationCardPanel",
            "designer|initialView": true,
            "layout": "card"
        },
        "customConfigs": [
            {
                "group": "(Custom Properties)",
                "name": "registrationUrl",
                "type": "string"
            },
            {
                "group": "(Custom Properties)",
                "name": "base64JsLocation",
                "type": "string"
            }
        ],
        "cn": [
            {
                "type": "Ext.TitleBar",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "docked": "top",
                    "title": "Sign Up !"
                }
            },
            {
                "type": "Ext.form.Panel",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "itemId": "whatsYourNameForm"
                },
                "cn": [
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "title": "Whats Your Name, Buddy !"
                        },
                        "cn": [
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "firstNameAsUserId",
                                    "label": null,
                                    "placeHolder": "Enter your first name.."
                                }
                            }
                        ]
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "title": "Type any word you like .."
                        },
                        "cn": [
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "wordYouLike",
                                    "label": null,
                                    "labelWidth": "0%",
                                    "placeHolder": "Temporary password.."
                                }
                            }
                        ]
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "itemId": "whatsYourNameFormSubmit",
                            "title": null
                        },
                        "cn": [
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "whatsYourNameFormButton",
                                    "ui": "action",
                                    "text": "Sign Up !"
                                },
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "fn": "handler",
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "implHandler": [
                                                "var registrationCardPanel = this.up('registrationCardPanel');",
                                                "",
                                                "var whatsYourNameForm = registrationCardPanel.down('#whatsYourNameForm');",
                                                "",
                                                "var firstNameAsUserid = whatsYourNameForm.down('#firstNameAsUserId');",
                                                "var wordYouLike = whatsYourNameForm.down('#wordYouLike');",
                                                "",
                                                "firstNameAsUserid = firstNameAsUserid.getValue();",
                                                "wordYouLike = wordYouLike.getValue();",
                                                "",
                                                "",
                                                "var userObject = {};// Could have used Ext.define('MyApp.model.User') but",
                                                "// want to avoid inline defining Ext classes as it really deserve ",
                                                "// separate file. This is exportable component, so want to avoid ",
                                                "// separate file too !",
                                                "",
                                                "",
                                                "userObject.userid = firstNameAsUserid;",
                                                "userObject.password = wordYouLike;",
                                                "",
                                                "var nameRgx = /^[A-Za-z ]{3,20}$/;",
                                                "var passwordRgx =  /^[A-Za-z0-9!@#$%^&*()_]{6,100}$/;",
                                                "var errors = [];",
                                                "",
                                                "for(var field in userObject){",
                                                "    if(userObject[field] === ''){",
                                                "        var msg = 'Fields Are Mandatory !';",
                                                "        Ext.Msg.alert('',msg,Ext.emptyFn);",
                                                "        errors[errors.length] = msg;",
                                                "        return;",
                                                "    }",
                                                "}",
                                                "",
                                                "if(! nameRgx.test(userObject.userid)){",
                                                "    var msg = 'Name is invalid ! At least 3 in length and no spaces. You could append last name';",
                                                "    Ext.Msg.alert('',msg,Ext.emptyFn); ",
                                                "    errors[errors.length] = msg;",
                                                "    return;",
                                                "}",
                                                "",
                                                "if(! passwordRgx.test(userObject.password)){",
                                                "    var msg = 'Password invalid, Min 6 in length, allowed a-z,0-9 and symbols !@#$%^&*()_';",
                                                "    Ext.Msg.alert('',msg,Ext.emptyFn); ",
                                                "    errors[errors.length] = msg;",
                                                "    return;",
                                                "}",
                                                "",
                                                "",
                                                "userObject.firstName = firstNameAsUserid;",
                                                "",
                                                "userObject.status = 'ACTIVE'; // If server has user status",
                                                "",
                                                "var userObjectJson = Ext.JSON.encode(userObject);",
                                                "",
                                                "",
                                                "var registrationUrl = registrationCardPanel.getInitialConfig().registrationUrl;",
                                                "",
                                                "Ext.Ajax.request({",
                                                "    url: registrationUrl,",
                                                "    method: 'post',",
                                                "    jsonData : userObjectJson,",
                                                "    headers : { ",
                                                "        Accept : 'application/json' ",
                                                "    },",
                                                "    success: function (response) { ",
                                                "        var createdUserObject = Ext.JSON.decode(response.responseText);       ",
                                                "        createdUserObject.plainPassword = wordYouLike;",
                                                "",
                                                "        var tok = createdUserObject.userid + ':' + createdUserObject.plainPassword;",
                                                "        var hash = Base64.encode(tok);",
                                                "        var authHeaderValue = \"Basic \" + hash;",
                                                "        createdUserObject.authHeaderValue = authHeaderValue ;",
                                                "",
                                                "        if (createdUserObject.createdOn !== null) { // Here anything can be used which confirms server has behaved good",
                                                "",
                                                "            var quickSignUpDoneForm = registrationCardPanel.down('#quickSignUpDoneForm');",
                                                "            var generatedUserId = quickSignUpDoneForm.down('#generatedUserId');",
                                                "            generatedUserId.setValue(createdUserObject.userid);",
                                                "            var wordAsPassword = quickSignUpDoneForm.down('#wordAsPassword');",
                                                "            wordAsPassword.setValue(createdUserObject.plainPassword);",
                                                "            ",
                                                "            quickSignUpDoneForm.createdUserObject = createdUserObject;",
                                                "            quickSignUpDoneForm = registrationCardPanel.down('#quickSignUpDoneForm');",
                                                "            registrationCardPanel.animateActiveItem(quickSignUpDoneForm, { type : 'slide'});",
                                                "        } else {",
                                                "            alert('Either return userObject had no same userid or two objects returned');",
                                                "        }",
                                                "    },",
                                                "    failure: function (response) {",
                                                "        //me.showSignInFailedMessage('Server error. Please try again later.');",
                                                "        var msg = 'Server error, try later';",
                                                "        Ext.Msg.alert('',msg,Ext.emptyFn);",
                                                "    }",
                                                "});",
                                                "",
                                                "",
                                                ""
                                            ]
                                        }
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },
            {
                "type": "Ext.form.Panel",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "itemId": "quickSignUpDoneForm"
                },
                "customConfigs": [
                    {
                        "group": "(Custom Properties)",
                        "name": "userCreated",
                        "type": "string"
                    }
                ],
                "cn": [
                    {
                        "type": "Ext.Label",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "html": "<h1>Quick Sign Up Done !</h1> <br/> <p style=\"font-size:small\">You can now use following auto-generated credentials on any device. This screen is shown only once ! </p>",
                            "ui": "light",
                            "designer|displayName": "quickSignUpDoneLabel"
                        }
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "itemId": "generatedUserIdFieldSet",
                            "title": ""
                        },
                        "cn": [
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "disabled": false,
                                    "itemId": "generatedUserId",
                                    "label": "Userid",
                                    "labelWidth": "40%",
                                    "readOnly": true
                                }
                            },
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "disabled": false,
                                    "itemId": "wordAsPassword",
                                    "label": "Password",
                                    "labelWidth": "40%",
                                    "readOnly": true
                                }
                            }
                        ]
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "title": null
                        },
                        "cn": [
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "ui": "action",
                                    "text": "Start Using App !"
                                },
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "fn": "handler",
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "implHandler": [
                                                "var registrationCardPanel = this.up('registrationCardPanel');",
                                                "var quickSignUpDoneForm = registrationCardPanel.down('#quickSignUpDoneForm');",
                                                "var userObject = quickSignUpDoneForm.createdUserObject;",
                                                "registrationCardPanel.fireEvent('signUpSuccess',userObject);"
                                            ]
                                        }
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "Ext.Label",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "html": "<p style=\"font-size:small\"> Click here, If you want to edit credentials and continue to full-fledge secure registration. </p>",
                            "designer|displayName": "continueSecureRegLabel"
                        }
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "itemId": "secureSignUpButtonFieldSet",
                            "title": ""
                        },
                        "cn": [
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "ui": "confirm",
                                    "text": "Secure Sign Up !"
                                },
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "fn": "handler",
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "implHandler": [
                                                "var registrationCardPanel = this.up('registrationCardPanel');",
                                                "var registrationPage1 = registrationCardPanel.down('#registrationPage1');",
                                                "var quickSignUpDoneForm = this.up('#quickSignUpDoneForm');",
                                                "",
                                                "var userObject = quickSignUpDoneForm.createdUserObject;",
                                                "",
                                                "var firstName = registrationPage1.down('#firstName');",
                                                "var lastName = registrationPage1.down('#lastName');",
                                                "var userEmail = registrationPage1.down('#userEmail');",
                                                "",
                                                "var userid = registrationPage1.down('#userid');",
                                                "var password = registrationPage1.down('#password');",
                                                "var readablePassword = registrationPage1.down('#readablePassword');",
                                                "",
                                                "",
                                                "registrationPage1.userObject = userObject; // Assigning userObject to ",
                                                "// registration page because will need things like current authValue",
                                                "// while updating the user",
                                                "",
                                                "firstName.setValue(userObject.firstName);",
                                                "lastName.setValue(userObject.lastName);",
                                                "userEmail.setValue(userObject.userEmail);",
                                                "",
                                                "userid.setValue(userObject.userid);",
                                                "password.setValue(userObject.plainPassword);",
                                                "readablePassword.setValue(userObject.plainPassword);",
                                                "",
                                                "registrationCardPanel.animateActiveItem(registrationPage1, { type : 'slide' });",
                                                "",
                                                ""
                                            ]
                                        }
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },
            {
                "type": "Ext.form.Panel",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "itemId": "registrationPage1"
                },
                "cn": [
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "title": "Personal Details"
                        },
                        "cn": [
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "firstName",
                                    "label": "First Name",
                                    "labelWidth": "37%",
                                    "name": "firstName"
                                }
                            },
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "lastName",
                                    "label": "Last Name",
                                    "labelWidth": "37%",
                                    "name": null
                                }
                            },
                            {
                                "type": "Ext.field.Email",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "userEmail",
                                    "label": "Email",
                                    "labelWidth": "37%",
                                    "name": null,
                                    "placeHolder": "email@example.com"
                                }
                            }
                        ]
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "title": "Credentials"
                        },
                        "cn": [
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "userid",
                                    "label": "User Id",
                                    "labelWidth": "37%",
                                    "name": null
                                }
                            },
                            {
                                "type": "Ext.field.Password",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "password",
                                    "label": "Password",
                                    "labelWidth": "37%",
                                    "name": null
                                }
                            },
                            {
                                "type": "Ext.field.Text",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "hidden": true,
                                    "itemId": "readablePassword",
                                    "label": "Password",
                                    "labelWidth": "37%",
                                    "name": null
                                }
                            },
                            {
                                "type": "Ext.field.Checkbox",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "showPasswordCheckBox",
                                    "label": "Show Password in Clear Text",
                                    "labelWidth": "50%"
                                },
                                "cn": [
                                    {
                                        "type": "basiceventbinding",
                                        "reference": {
                                            "name": "listeners",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "fn": "onShowPasswordCheckBoxCheck",
                                            "implHandler": [
                                                "var registrationPage1 = checkboxfield.up('#registrationPage1');",
                                                "",
                                                "var password = registrationPage1.down('#password');",
                                                "var readablePassword = registrationPage1.down('#readablePassword');",
                                                "readablePassword.setValue(password.getValue());",
                                                "password.hide();",
                                                "readablePassword.show();"
                                            ],
                                            "name": "check"
                                        }
                                    },
                                    {
                                        "type": "basiceventbinding",
                                        "reference": {
                                            "name": "listeners",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "fn": "onShowPasswordCheckBoxUncheck",
                                            "implHandler": [
                                                "var registrationPage1 = checkboxfield.up('#registrationPage1');",
                                                "",
                                                "var password = registrationPage1.down('#password');",
                                                "var readablePassword = registrationPage1.down('#readablePassword');",
                                                "password.setValue(readablePassword.getValue());",
                                                "password.show();",
                                                "readablePassword.hide();"
                                            ],
                                            "name": "uncheck"
                                        }
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "type": "Ext.form.FieldSet",
                        "reference": {
                            "name": "items",
                            "type": "array"
                        },
                        "codeClass": null,
                        "userConfig": {
                            "itemId": "myfieldset2",
                            "designer|displayName": "NextButtonFieldSet",
                            "title": null
                        },
                        "cn": [
                            {
                                "type": "Ext.Button",
                                "reference": {
                                    "name": "items",
                                    "type": "array"
                                },
                                "codeClass": null,
                                "userConfig": {
                                    "itemId": "updateProfile",
                                    "ui": "action",
                                    "text": "Save And Go To App"
                                },
                                "cn": [
                                    {
                                        "type": "fixedfunction",
                                        "reference": {
                                            "name": "items",
                                            "type": "array"
                                        },
                                        "codeClass": null,
                                        "userConfig": {
                                            "fn": "handler",
                                            "designer|params": [
                                                "button",
                                                "event"
                                            ],
                                            "implHandler": [
                                                "var registrationCardPanel = this.up('registrationCardPanel');",
                                                "var registrationPage1 = registrationCardPanel.down('#registrationPage1');",
                                                "",
                                                "var firstName = registrationPage1.down('#firstName');",
                                                "var lastName = registrationPage1.down('#lastName');",
                                                "var userEmail = registrationPage1.down('#userEmail');",
                                                "//var confirmEmail = registrationCardPanel.down('#confirmEmail');",
                                                "",
                                                "var userid = registrationPage1.down('#userid');",
                                                "var password = registrationPage1.down('#password');",
                                                "var readablePassword = registrationPage1.down('#readablePassword');",
                                                "var showPasswordCheckBox = registrationPage1.down('#showPasswordCheckBox');",
                                                "",
                                                "var userObject = registrationPage1.userObject;",
                                                "var currentAuthHeaderValue = userObject.authHeaderValue;",
                                                "",
                                                "userObject.firstName = firstName.getValue();",
                                                "userObject.lastName = lastName.getValue();",
                                                "userObject.userEmail = userEmail.getValue();",
                                                "//userObject.confirmEmail = confirmEmail.getValue();",
                                                "",
                                                "userObject.userid = userid.getValue();",
                                                "",
                                                "if(showPasswordCheckBox.getSubmitValue() === null) {",
                                                "    userObject.password = password.getValue();",
                                                "}else {",
                                                "    userObject.password = readablePassword.getValue();",
                                                "}",
                                                "",
                                                "",
                                                "//////////////////////Validations////////////////////////////////",
                                                "var nameRgx = /^[A-Za-z ]{3,20}$/;",
                                                "var emailRgx = /^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/;",
                                                "var useridRgx = /^[A-Za-z0-9_]{6,16}$/;",
                                                "var passwordRgx =  /^[A-Za-z0-9!@#$%^&*()_]{6,100}$/;",
                                                "var errors = [];",
                                                "",
                                                "for(var field in userObject){",
                                                "    console.log(field + ': ' + userObject[field]);",
                                                "    if(userObject[field] === ''){",
                                                "        Ext.Msg.alert('','All fields are mandatory !',Ext.emptyFn);",
                                                "        errors[errors.length] = 'All fields are mandatory !';",
                                                "        return;",
                                                "    }",
                                                "}",
                                                "",
                                                "if(! nameRgx.test(userObject.firstName)){",
                                                "    Ext.Msg.alert('','First Name format invalid',Ext.emptyFn); ",
                                                "    errors[errors.length] = 'First Name format invalid !';",
                                                "    return;",
                                                "}",
                                                "",
                                                "",
                                                "if(! nameRgx.test(userObject.lastName)){",
                                                "    Ext.Msg.alert('','Last Name format invalid',Ext.emptyFn);",
                                                "    errors[errors.length] = 'Last Name format invalid !';",
                                                "    return;",
                                                "}",
                                                "",
                                                "",
                                                "if(! emailRgx.test(userObject.userEmail)){",
                                                "    Ext.Msg.alert('','Email format invalid',Ext.emptyFn); ",
                                                "    errors[errors.length] = 'Email format invalid';",
                                                "    return;",
                                                "}",
                                                "/*",
                                                "if(userObject.userEmail !== userObject.confirmEmail) {",
                                                "Ext.Msg.alert('','Emails do not match !',Ext.emptyFn);",
                                                "errors[errors.length] =  'Emails do not match !';",
                                                "return;",
                                                "}",
                                                "*/",
                                                "",
                                                "if(! useridRgx.test(userObject.userid)){",
                                                "    Ext.Msg.alert('','Userid Invalid, must be 6 in length, no special symbols',Ext.emptyFn); ",
                                                "    errors[errors.length] =  'Userid Invalid, must be 6 in length, no special symbols';",
                                                "    return;",
                                                "}",
                                                "",
                                                "if(! passwordRgx.test(userObject.password)){",
                                                "    Ext.Msg.alert('','Password invalid, Min 6 in length, allowed a-z,0-9 and symbols !@#$%^&*()_',Ext.emptyFn); ",
                                                "    errors[errors.length] = 'Password invalid, Min 6 in length, allowed a-z,0-9 and symbols !@#$%^&*()_';",
                                                "    return;",
                                                "}",
                                                "",
                                                "/*",
                                                "// Remember in order to report all errors at once, you have to remove all return statements.",
                                                "var msg = \"Please Enter Valide Data...\\n\";",
                                                "for (var i = 0; i<errors.length; i++) {",
                                                "    var numError = i + 1;",
                                                "    msg += \"\\n\" + numError + \". \" + errors[i];",
                                                "}",
                                                "alert(msg);",
                                                "*/",
                                                "/////////////////////////////////////////////////////////////////",
                                                "var userObjectJson = Ext.JSON.encode(userObject);",
                                                "",
                                                "",
                                                "var registrationUrl = registrationCardPanel.getInitialConfig().registrationUrl;",
                                                "",
                                                "Ext.Ajax.request({",
                                                "    url: registrationUrl,",
                                                "    method: 'put',",
                                                "    jsonData : userObjectJson,",
                                                "    headers : { ",
                                                "        Accept : 'application/json' ,",
                                                "        Authorization : currentAuthHeaderValue // User needs to use current",
                                                "        // authHeader value based on current password",
                                                "    },",
                                                "    success: function (response) { ",
                                                "",
                                                "        var updatedUserObject = Ext.JSON.decode(response.responseText);",
                                                "",
                                                "        if (updatedUserObject.updatedON > userObject.updatedON) {",
                                                "            updatedUserObject.plainPassword = userObject.password;",
                                                "            var tok = updatedUserObject.userid + ':' + updatedUserObject.plainPassword ;",
                                                "            var hash = Base64.encode(tok);",
                                                "            var authHeaderValue = \"Basic \" + hash;",
                                                "",
                                                "            updatedUserObject.authHeaderValue = authHeaderValue ; ",
                                                "",
                                                "            registrationCardPanel.fireEvent('signUpSuccess',updatedUserObject);",
                                                "        } else {",
                                                "            var msg = 'Server error, please try later';",
                                                "            Ext.Msg.alert('',msg,Ext.emptyFn);  ",
                                                "        }",
                                                "    },",
                                                "    failure: function (response) {",
                                                "        if(response.status === 409) {",
                                                "            var msg = 'User id taken';",
                                                "            Ext.Msg.alert('',msg,Ext.emptyFn); ",
                                                "        }else{",
                                                "            var msg = 'Server error, please try later';",
                                                "            Ext.Msg.alert('',msg,Ext.emptyFn);    ",
                                                "        }",
                                                "    }",
                                                "});",
                                                ""
                                            ]
                                        }
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ]
    },
    "linkedNodes": {},
    "boundStores": {},
    "boundModels": {}
}