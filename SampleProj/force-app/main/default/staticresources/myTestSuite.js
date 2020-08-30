describe("Lightning Component Testing Examples", function () {
    afterEach(function () {
        $T.clearRenderedTestComponents();
    });
     
    describe("A suite that tests the obvious", function() {
        it("spec that verifies that true is true", function() {
            expect(true).toBe(true);
        });
    });

    describe('c:helloWorld', function () {
        it('verify component rendering', function (done) {
            $T.createComponent('c:helloWorld', {}, true)
                .then(function(cmp) {
                    expect(cmp.find("message").getElement().innerHTML).toBe('Hello World!');
                    done();
                }).catch(function (e) {
                    done.fail(e);
                });
        });
    })

    describe('c:componentWithDataBinding', function () {
           it('verify data binding', function (done) {
              $T.createComponent('c:componentWithDataBinding', {message: 'Hello Ganesh!'}, true)
                 .then(function (component) {
                    expect(component.find("message").getElement().innerHTML).toBe('Hello Ganesh!');
                    expect(component.find("messageInput").get("v.value")).toBe('Hello Ganesh!');
                    done();
              }).catch(function (e) {
                    done.fail(e);
              });
           });
        });

        describe('c:accountList', function () {
            it('verify server method invocation', function (done) {
                $T.createComponent("c:accountList")
                    .then(function (component) {
                    expect(component.get("v.accounts").length).toBe(0);
                        $T.run(component.loadAccounts);
                        return $T.waitFor(function () {
                            return component.get("v.accounts").length === 3;
                        })
                    }).then(function () {
                        done();
                    }).catch(function (e) {
                        done.fail(e);
                    });
            });
        });

        describe('c:accountList', function () {
    it('verify server method invocation', function (done) {
        $T.createComponent("c:accountList")
            .then(function (component) {
            expect(component.get("v.accounts").length).toBe(0);
                $T.run(component.loadAccounts);
                return $T.waitFor(function () {
                    return component.get("v.accounts").length === 3;
                })
            }).then(function () {
                done();
            }).catch(function (e) {
                done.fail(e);
            });
    });
});
        
});