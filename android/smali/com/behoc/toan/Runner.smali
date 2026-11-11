.class public Lcom/behoc/toan/Runner;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final web:Landroid/webkit/WebView;
.field private final js:Ljava/lang/String;

.method public constructor <init>(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/behoc/toan/Runner;->web:Landroid/webkit/WebView;
    iput-object p2, p0, Lcom/behoc/toan/Runner;->js:Ljava/lang/String;
    return-void
.end method

.method public run()V
    .registers 4
    iget-object v0, p0, Lcom/behoc/toan/Runner;->web:Landroid/webkit/WebView;
    iget-object v1, p0, Lcom/behoc/toan/Runner;->js:Ljava/lang/String;
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    return-void
.end method
