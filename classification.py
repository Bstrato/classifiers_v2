import pandas as pd
from sklearn.tree import DecisionTreeClassifier  # Decision Tree Classifier
from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.tree import export_graphviz
from six import StringIO
from IPython.display import Image
import pydotplus
import scikitplot as skplt
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt
from sklearn import svm
from sklearn import linear_model, preprocessing
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.naive_bayes import MultinomialNB
from sklearn.cluster import KMeans
from sklearn.calibration import CalibratedClassifierCV
import itertools
import warnings
import numpy as np
from sklearn import preprocessing
import seaborn as sns
import phik
from sklearn.ensemble import RandomForestClassifier


# sns.set(rc={'figure.figsize':(11.7,8.27)}) # set the seaborn stylesheet
warnings.filterwarnings("ignore")

# FEATURES = ["temp","hgbl","mal","anem"]
FEATURES = ['Gender', 'bcg', 'penta1', 'penta2', 'penta3', 'rotav1', 'rotav1', 'polio0', 'polio1', 'polio2', 'pnuemo1',
            'pnuemo2', 'rtss2']


def plot_confusion_matrix(cm, target_names, title='Confusion matrix', cmap=None, normalize=True, name=''):
    '''
     Confusion plot
    Parameters
    ----------
    cm
    target_names
    title
    cmap
    normalize
    name

    Returns
    -------

    '''
    accuracy = np.trace(cm) / float(np.sum(cm))
    misclass = 1 - accuracy

    if cmap is None:
        cmap = plt.get_cmap('Blues')

    plt.figure(figsize=(8, 6))
    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title + name)
    plt.colorbar()

    if target_names is not None:
        tick_marks = np.arange(len(target_names))
        plt.xticks(tick_marks, target_names, rotation=45)
        plt.yticks(tick_marks, target_names)

    if normalize:
        # cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        pass

    thresh = cm.max() / 1.5 if normalize else cm.max() / 2
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):

        if normalize:
            plt.text(j, i, "{:}".format(cm[i, j]),
                     horizontalalignment="center",
                     color="white" if cm[i, j] > thresh else "black")
        else:
            plt.text(j, i, "{:,}".format(cm[i, j]),
                     horizontalalignment="center",
                     color="white" if cm[i, j] > thresh else "black")

    # plt.tight_layout()
    plt.ylabel('True label')
    plt.xlabel('Predicted label\n accuracy={:0.4f}; misclass={:0.4f}'.format(accuracy, misclass))
    plt.savefig('results/confusion_' + name + '.png')
    plt.show()


def data_loader():
    '''
      Function to load CSV contionous column features and binary label
     '''

    pima_data = pd.read_csv("vaccine_visit.csv")

    pima_data = pima_data.dropna()

    # get feature correltion
    feature_corelation(pima_data)

    # get data statistic
    print("**** Sample Data *****", end='\n')
    print(pima_data.head())

    print("\n\n***** Data Statistics *****", end='\n\n')
    print(pima_data.describe())
    print("***** End of Data Statistics *****", end='\n\n\n')

    # Get features and target
    X = pima_data.drop("rtss2", axis=1)
    # X = X.drop("rtss2", axis=1)
    y = pima_data['rtss2']  # Target variable

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1)

    return X_train, X_test, y_train, y_test


def feature_corelation(data):
    # find the corelation between inputs
    corr = data.corr(method='pearson')

    # plot heatmap
    plt.figure(figsize=(11, 8.27))
    sns.heatmap(corr,
                xticklabels=corr.columns.values,
                yticklabels=corr.columns.values,
                cmap=sns.light_palette("navy"),
                annot=corr
                )

    plt.title("Feature Corelation Matrix")

    plt.savefig('results/feature_corelation.png')

    plt.show()


def max_decision_tree(x_train, x_test, y_trains, y_tests):
    # Initializing decsion classifier
    clf = DecisionTreeClassifier()

    # Train Decision Tree Classifer
    clf = clf.fit(x_train, y_trains)

    # Predict the response for test dataset
    y_pred = clf.predict(x_test)

    probability_list = clf.predict_proba(x_test)

    # Metric Report
    metric_report(y_tests, y_pred, probability_list, name='decision_tree_max_depth')

    # Plot tree
    plot_decision_tree(clf, FEATURES, name='decision_tree_max_depth')


def optimized_decision_tree(x_train, x_test, y_trains, y_tests, m_depth=2):
    # Initializing decsion classifier
    clf = DecisionTreeClassifier(criterion="entropy", max_depth=m_depth)

    # Train Decision Tree Classifer
    clf = clf.fit(x_train, y_trains)

    # Predict the response for test dataset
    y_pred = clf.predict(x_test)

    probability_list = clf.predict_proba(x_test)

    # Metric Report
    metric_report(y_tests, y_pred, probability_list, name='optimized_tree_max_depth_2')

    # Plot tree
    plot_decision_tree(clf, FEATURES, name='optimized_tree_max_depth_2')


def svm_classifier(x_train, x_test, y_trains, y_tests):
    '''
    SMV classifier
    Parameters
    ----------
    x_train
    x_test
    y_trains
    y_tests

    Returns
    -------

    '''
    clf = linear_model.SGDClassifier(tol=1e-3, verbose=0)

    clf.fit(x_train, y_trains)

    y_pred = clf.predict(x_test)
    # metric_report(clf, valid_label, y_pred)

    calibrator = CalibratedClassifierCV(clf, cv='prefit')
    model = calibrator.fit(x_train, y_trains)

    probability_list = model.predict_proba(x_test)

    # Metric Report
    metric_report(y_tests, y_pred, probability_list, name='SVM')


def knn_classifier(x_train, x_test, y_trains, y_tests):
    '''
    Knn Classifier
    Parameters
    ----------
    x_train
    x_test
    y_trains
    y_tests

    Returns
    -------
    '''
    # Create KNN Classifier
    clf = KNeighborsClassifier(n_neighbors=7)

    # Train the model using the training sets
    clf.fit(x_train, y_trains)

    # Predict the response for test dataset
    y_pred = clf.predict(x_test)

    probability_list = clf.predict_proba(x_test)

    metric_report(y_tests, y_pred, probability_list, name='KNN')


def random_classifier(x_train, x_test, y_trains, y_tests):
    '''
    Knn Classifier
    Parameters
    ----------
    x_train
    x_test
    y_trains
    y_tests

    Returns
    -------
    '''
    # Create KNN Classifier
    clf = RandomForestClassifier(max_depth=2, random_state=0)

    # Train the model using the training sets
    clf.fit(x_train, y_trains)

    # Predict the response for test dataset
    y_pred = clf.predict(x_test)

    probability_list = clf.predict_proba(x_test)

    metric_report(y_tests, y_pred, probability_list, name='Random Forest')


def naive_classifier(x_train, x_test, y_trains, y_tests):
    '''
    Naive bayes classifier
    Parameters
    ----------
    x_train
    x_test
    y_trains
    y_tests

    Returns
    -------
    '''

    clf = MultinomialNB(alpha=1.0, class_prior=None, fit_prior=True)

    clf.fit(x_train, y_trains)

    y_pred = clf.predict(x_test)

    probability_list = clf.predict_proba(x_test)

    metric_report(y_tests, y_pred, probability_list, name='Naive_Bayes')


def metric_report(y_test, y_pred, prob_list, name=''):
    '''
    function for metric statistics

    :param y_test:
    :param y_pred:
    :param prob_list:
    :param name:
    :return:
    '''

    acc = metrics.accuracy_score(y_test, y_pred)

    cm = confusion_matrix(y_test, y_pred)
    tn, fp, fn, tp = cm.ravel()
    specificity = tn / (tn + fp)
    sensivity = tp / (tp + fn)

    print(name + '=> ', 'Accuracy : %.3f' % acc, 'Sensivity : %.3f' % sensivity,
          'Specificity : %.3f' % specificity, end='\n')

    print(metrics.classification_report(y_test, y_pred), end='\n')

    # plotting roc
    skplt.metrics.plot_roc_curve(y_test, prob_list)
    plt.title(name)
    plt.savefig('results/roc_' + name + '.png')
    plt.show()

    plot_confusion_matrix(cm, ['0', '1'], title='Confusion matrix for ', name=name)


def plot_decision_tree(clf, FEATURES, name=''):
    '''
    funtion handling decision tree plot
    :param clf:
    :param FEATURES:
    :param name:
    :return:
    '''
    dot_data = StringIO()
    export_graphviz(clf, out_file=dot_data,
                    filled=True, rounded=True,
                    special_characters=True, feature_names=FEATURES, class_names=['0', '1'])
    graph = pydotplus.graph_from_dot_data(dot_data.getvalue())
    graph.write_png('results/' + name + '.png')
    Image(graph.create_png())


if __name__ == '__main__':
    data = data_loader()
    print('**** Performance Evaluation ****', end='\n\n')

    # ML Algoirthms
    optimized_decision_tree(*data)
    svm_classifier(*data)
    naive_classifier(*data)
    knn_classifier(*data)
    random_classifier(*data)
