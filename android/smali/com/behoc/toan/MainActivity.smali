.class public Lcom/behoc/toan/MainActivity;
.super Landroid/app/Activity;
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;

.field private web:Landroid/webkit/WebView;
.field private tts:Landroid/speech/tts/TextToSpeech;

.method public constructor <init>()V
    .registers 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/behoc/toan/MainActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    const/16 v1, 0x80
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    new-instance v0, Landroid/webkit/WebView;
    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V
    iput-object v0, p0, Lcom/behoc/toan/MainActivity;->web:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v1
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V
    const/4 v3, 0x0
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    const v1, -0xb0405
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    new-instance v1, Landroid/webkit/WebViewClient;
    invoke-direct {v1}, Landroid/webkit/WebViewClient;-><init>()V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    new-instance v1, Landroid/speech/tts/TextToSpeech;
    invoke-direct {v1, p0, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V
    iput-object v1, p0, Lcom/behoc/toan/MainActivity;->tts:Landroid/speech/tts/TextToSpeech;

    new-instance v1, Lcom/behoc/toan/Bridge;
    invoke-direct {v1, p0}, Lcom/behoc/toan/Bridge;-><init>(Lcom/behoc/toan/MainActivity;)V
    const-string v2, "Android"
    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "file:///android_asset/game.html"
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/behoc/toan/MainActivity;->setContentView(Landroid/view/View;)V
    invoke-virtual {v0}, Landroid/webkit/WebView;->requestFocus()Z
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V
    return-void
.end method

.method public onInit(I)V
    .registers 6
    if-nez p1, :done
    iget-object v0, p0, Lcom/behoc/toan/MainActivity;->tts:Landroid/speech/tts/TextToSpeech;
    if-eqz v0, :done
    new-instance v1, Ljava/util/Locale;
    const-string v2, "vi"
    const-string v3, "VN"
    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I
    :done
    return-void
.end method

.method public speak(Ljava/lang/String;FF)V
    .registers 7
    iget-object v0, p0, Lcom/behoc/toan/MainActivity;->tts:Landroid/speech/tts/TextToSpeech;
    if-eqz v0, :done
    invoke-virtual {v0, p2}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I
    invoke-virtual {v0, p3}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I
    const/4 v1, 0x0
    const/4 v2, 0x0
    invoke-virtual {v0, p1, v1, v2}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I
    :done
    return-void
.end method

.method protected onDestroy()V
    .registers 2
    iget-object v0, p0, Lcom/behoc/toan/MainActivity;->tts:Landroid/speech/tts/TextToSpeech;
    if-eqz v0, :skip
    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->shutdown()V
    :skip
    iget-object v0, p0, Lcom/behoc/toan/MainActivity;->web:Landroid/webkit/WebView;
    if-eqz v0, :skip2
    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V
    :skip2
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 6
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
    const/16 v2, 0x15
    if-ne v0, v2, :k0
    const-string v1, "window.tvKey&&tvKey('L')"
    goto :have
    :k0
    const/16 v2, 0x16
    if-ne v0, v2, :k1
    const-string v1, "window.tvKey&&tvKey('R')"
    goto :have
    :k1
    const/16 v2, 0x13
    if-ne v0, v2, :k2
    const-string v1, "window.tvKey&&tvKey('U')"
    goto :have
    :k2
    const/16 v2, 0x14
    if-ne v0, v2, :k3
    const-string v1, "window.tvKey&&tvKey('D')"
    goto :have
    :k3
    const/16 v2, 0x17
    if-ne v0, v2, :k4
    const-string v1, "window.tvKey&&tvKey('OK')"
    goto :have
    :k4
    const/16 v2, 0x42
    if-ne v0, v2, :k5
    const-string v1, "window.tvKey&&tvKey('OK')"
    goto :have
    :k5
    const/16 v2, 0xa0
    if-ne v0, v2, :k6
    const-string v1, "window.tvKey&&tvKey('OK')"
    goto :have
    :k6
    const/16 v2, 0x4
    if-ne v0, v2, :b0
    const-string v1, "window.tvKey&&tvKey('BACK')"
    goto :have
    :b0
    const/16 v2, 0x6f
    if-ne v0, v2, :b1
    const-string v1, "window.tvKey&&tvKey('BACK')"
    goto :have
    :b1
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    move-result v0
    return v0
    :have
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I
    move-result v2
    if-nez v2, :consume
    iget-object v2, p0, Lcom/behoc/toan/MainActivity;->web:Landroid/webkit/WebView;
    if-eqz v2, :consume
    const/4 v3, 0x0
    invoke-virtual {v2, v1, v3}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :consume
    const/4 v0, 0x1
    return v0
.end method
